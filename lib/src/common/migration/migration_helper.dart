import 'package:l/l.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textly/src/common/consts/config_app.dart';

abstract class MigrationHelper {
  static Future<void> migrate(SharedPreferences sharedPreferences) async {
    try {
      final prevAppVersion = sharedPreferences.getString('app_version');

      if (prevAppVersion == appVersion) {
        l.i('Версия не изменилась: $appVersion ');
        return;
      } else {
        l.i('Переходим с версии $prevAppVersion на $appVersion');
      }

      await sharedPreferences.setString('app_version', appVersion);
    } on Object {
      l.e('Ошибка миграции приложения');
      rethrow;
    }
  }
}
