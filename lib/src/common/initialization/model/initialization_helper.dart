import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:l/l.dart';
import 'package:platform_info/platform_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textly/src/common/consts/config_app.dart';

import 'package:textly/src/common/initialization/model/initialization_progress.dart';
import 'package:textly/src/common/initialization/model/repository_storage.dart';
import 'package:textly/src/common/migration/migration_helper.dart';
import 'package:textly/src/common/model/app_metadata.dart';
import 'package:textly/src/common/utils/screen_util.dart';
import 'package:textly/src/feature/auth/data/auth_repo.dart';
import 'package:textly/src/feature/auth/data/user_data_provider.dart';

class InitializationHelper {
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;
  bool get isNotInitialized => !isInitialized;

  InitializationProgress _initializationProgress =
      const InitializationProgress();

  void reset() {
    _isInitialized = false;
    _initializationProgress = const InitializationProgress();
  }

  RepositoryStorage getResult() => _initializationProgress.getResult();

  Stream<InitializationProgressStatus> initialize() async* {
    _isInitialized = false;
    final totalSteps = _initializationSteps.length;
    var currentStep = 0;
    var initializationProgress = _initializationProgress;
    final stopwatch = Stopwatch()..start();
    try {
      await for (final step
          in Stream.fromIterable(_initializationSteps.entries)) {
        currentStep++;
        yield InitializationProgressStatus(
          progress: (currentStep * 100 ~/ totalSteps).clamp(0, 100),
          message: step.key,
        );
        initializationProgress = await step.value(initializationProgress);
      }
      final elapsedMilliseconds = stopwatch.elapsedMilliseconds;
      _initializationProgress = initializationProgress;
      l.i('Success initialized: time: $elapsedMilliseconds');

      _isInitialized = true;
    } finally {
      stopwatch
        ..stop()
        ..reset();
    }
  }
}

class InitializationProgressStatus {
  const InitializationProgressStatus({
    required this.progress,
    required this.message,
  });
  final int progress;
  final String message;
}

final Map<
    String,
    FutureOr<InitializationProgress> Function(
  InitializationProgress progress,
)> _initializationSteps = <String,
    FutureOr<InitializationProgress> Function(InitializationProgress progress)>{
  'Create dio': (store) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiDomen,
      ),
    );

    return store.copyWith(dio: dio);
  },
  'Creating app metadata': (store) async {
    final screenSize = ScreenUtil.screenSize();
    final appMetadata = AppMetadata(
      isWeb: kIsWeb,
      isRelease: platform.buildMode.isRelease,
      appVersion: appVersion,
      appPackageName: 'textly',
      appName: 'Textly',
      operatingSystem: platform.when<String>(
            android: () => 'Android',
            iOS: () => 'iOS',
            macOS: () => 'macOS',
            windows: () => 'Windows',
            fuchsia: () => 'Fuchsia',
            linux: () => 'Linux',
          ) ??
          'Other',
      processorsCount: platform.numberOfProcessors,
      appLaunchedTimestamp: DateTime.now().millisecondsSinceEpoch,
      locale: platform.locale,
      deviceRepresentation: screenSize.representation,
      deviceLogicalSideMin: screenSize.min,
      deviceLogicalSideMax: screenSize.max,
    );
    return store.copyWith(appMetadata: appMetadata);
  },
  'Initializing local keystore': (progress) =>
      SharedPreferences.getInstance().then<InitializationProgress>(
        (sharedPreferences) => progress.copyWith(
          sharedPreferences: sharedPreferences,
        ),
      ),
  'Creating UserDataProvider': (store) => store.copyWith(
        userDataProvider: SharedPrefsUserDataProvider(store.sharedPreferences!),
      ),
  'Creating AuthRepository': (store) async {
    final authRepo = ApiAuthRepository(
      firstFetchUser: await store.userDataProvider!.getFromStorage(),
      dio: store.dio!,
      userDataProvider: store.userDataProvider!,
    );
    return store.copyWith(authRepository: authRepo);
  },
  'Migrate app from previous version': (store) async {
    final sharedPrefs = store.sharedPreferences;
    if (sharedPrefs == null) return store;
    await MigrationHelper.migrate(sharedPrefs);
    return store;
  },
};
