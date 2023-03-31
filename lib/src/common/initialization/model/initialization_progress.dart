import 'package:shared_preferences/shared_preferences.dart';
import 'package:textly/src/common/initialization/model/repository_storage.dart';
import 'package:textly/src/common/model/app_metadata.dart';

class InitializationProgress {
  const InitializationProgress({
    this.appMetadata,
    this.sharedPreferences,
  });
  final AppMetadata? appMetadata;
  final SharedPreferences? sharedPreferences;

  InitializationProgress copyWith({
    AppMetadata? appMetadata,
    SharedPreferences? sharedPreferences,
  }) =>
      InitializationProgress(
        appMetadata: appMetadata ?? this.appMetadata,
        sharedPreferences: sharedPreferences ?? this.sharedPreferences,
      );

  RepositoryStorage getResult() => RepositoryStorage(
        appMetadata: appMetadata!,
      );
}
