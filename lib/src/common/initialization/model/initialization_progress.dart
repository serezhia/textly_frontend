import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textly/src/common/initialization/model/repository_storage.dart';
import 'package:textly/src/common/model/app_metadata.dart';
import 'package:textly/src/feature/auth/data/auth_repo.dart';
import 'package:textly/src/feature/auth/data/user_data_provider.dart';

class InitializationProgress {
  const InitializationProgress({
    this.userDataProvider,
    this.appMetadata,
    this.sharedPreferences,
    this.authRepository,
    this.dio,
  });
  final AppMetadata? appMetadata;
  final SharedPreferences? sharedPreferences;
  final IAuthRepository? authRepository;
  final Dio? dio;
  final IUserDataProvider? userDataProvider;

  InitializationProgress copyWith({
    AppMetadata? appMetadata,
    SharedPreferences? sharedPreferences,
    IAuthRepository? authRepository,
    Dio? dio,
    IUserDataProvider? userDataProvider,
  }) =>
      InitializationProgress(
        appMetadata: appMetadata ?? this.appMetadata,
        sharedPreferences: sharedPreferences ?? this.sharedPreferences,
        authRepository: authRepository ?? this.authRepository,
        dio: dio ?? this.dio,
        userDataProvider: userDataProvider ?? this.userDataProvider,
      );

  RepositoryStorage getResult() => RepositoryStorage(
        appMetadata: appMetadata!,
        authRepository: authRepository!,
      );
}
