import 'dart:async';

import 'package:flutter/foundation.dart' show FlutterError;
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;
import 'package:l/l.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:textly/main/bootstrap.dart';

import 'package:textly/runner/runner_unknow.dart'
    if (dart.library.io) 'package:textly/runner/runner_io.dart'
    if (dart.library.html) 'package:textly/runner/runner_web.dart' as runner;
import 'package:textly/src/common/utils/log_util.dart';
import 'package:textly/src/common/utils/sentry_util.dart';

/// Entry point
void main() => l.capture<void>(
      () => SentryUtil.wrap(_appRunner),
      const LogOptions(
        messageFormatting: _messageFormatting,
        outputInRelease: true,
        handlePrint: true,
      ),
    );

Future<void> _appRunner() async {
  // Запуск таймера
  final stopwatchBeforeRunApp = Stopwatch()..start();

  // Логировать все ошибки флатера

  final sourceFlutterError = FlutterError.onError;
  FlutterError.onError = (details) {
    l.w(details.exceptionAsString(), details.stack);
    sourceFlutterError?.call(details);
  };

  // Отложенная инициализация
  WidgetsFlutterBinding.ensureInitialized();
  final ensureInitializedMs = stopwatchBeforeRunApp.elapsedMilliseconds;

  // Запуск приложения в зависимости от платформы

  await bootstrap(runner.runApp);

  final elapsedMilliseconds =
      (stopwatchBeforeRunApp..stop()).elapsedMilliseconds;

  if (elapsedMilliseconds > 2000) {
    final initMessage = '''
        Инициализация приложения продлилась дольше предполагаемого:
        ${stopwatchBeforeRunApp.elapsedMilliseconds} мс
        Отложенная инициализация заняла: $ensureInitializedMs мс''';

    l.w(initMessage);
    LogUtil.logMessage(
      'Long Initialization',
      hint: Hint(),
    );
  }
}

/// Logs message formatting
Object _messageFormatting(Object message, LogLevel logLevel, DateTime dt) =>
    '${dt.hour.toString().padLeft(2, '0')}:'
    '${dt.minute.toString().padLeft(2, '0')}:'
    '${dt.second.toString().padLeft(2, '0')} '
    '$message';
