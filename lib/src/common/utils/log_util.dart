import 'package:l/l.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class LogUtil {
  LogUtil._();

  static void logError(
    Object exception, {
    StackTrace? stackTrace,
    Hint? hint,
  }) {
    try {
      if (exception is String) {
        return logMessage(
          exception,
          stackTrace: stackTrace,
          warning: true,
        );
      }
      Sentry.captureException(exception, stackTrace: stackTrace, hint: hint);
    } on Object catch (error, stackTrace) {
      l.e('Произошло исключение "$error" в ErrorUtil.logError', stackTrace);
    }
  }

  static void logMessage(
    String message, {
    StackTrace? stackTrace,
    Hint? hint,
    bool warning = false,
    List<String>? params,
  }) {
    try {
      Sentry.captureMessage(
        message,
        level: warning ? SentryLevel.warning : SentryLevel.info,
        hint: hint,
        params: <String>[
          ...?params,
          if (stackTrace != null) 'StackTrace: $stackTrace',
        ],
      );
    } on Object catch (error, stackTrace) {
      l.e('Exeption in  "$error" в LogUtil.logMessage', stackTrace);
    }
  }
}
