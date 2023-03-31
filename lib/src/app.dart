import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:textly/src/common/initialization/bloc/initialization_bloc.dart';
import 'package:textly/src/common/initialization/model/initialization_helper.dart';
import 'package:textly/src/common/initialization/model/repository_storage.dart';
import 'package:textly/src/common/widgets/material_context.dart';
import 'package:textly/src/common/widgets/repostiory_scope.dart';

@immutable
class App extends StatelessWidget {
  const App({
    required RepositoryStorage repositoryStorage,
    super.key,
  }) : _repositoryStorage = repositoryStorage;

  /// Инициализировать и запустить приложение
  /// Приложение запускается только после успешной инициализации
  /// Предполагается, что в это время показывается нейтивный сплэш экран
  static Future<BuildContext> initializeAndRun({
    /// Вызывается на каждом этапе прогресса инициализации
    void Function(int progress, String message)? onProgress,

    /// Вызывается при неуспешной инициализации
    void Function(String message, Object error, StackTrace stackTrace)?
        onFailureInitialization,

    /// Вызывается при успешной инициализации, после отображения первых кадров
    void Function(RepositoryStorage store)? onSuccessfulInitialization,
  }) async {
    final initializationCompleter = Completer<BuildContext>();
    final stopwatch = Stopwatch()..start();
    try {
      final binding = WidgetsFlutterBinding.ensureInitialized()
        ..deferFirstFrame();
      final initBloc =
          InitializationBLoC(initializationHelper: InitializationHelper())
            ..add(const InitializationEvent.initialize());
      StreamSubscription<InitializationState>? initSub;
      initSub = initBloc.stream.listen(
        (state) => state.map<void>(
          initializationInProgress: (state) {
            onProgress?.call(state.progress, state.message);
            // Инициализируется
          },
          error: (state) {
            // Произошла ошибка инициализации
            initSub?.cancel();
            initBloc.close();
            initializationCompleter.completeError(
              state.error,
              StackTrace.current,
            );
            if (onFailureInitialization != null) {
              onFailureInitialization(
                state.message,
                state.error,
                state.stackTrace,
              );
            }
          },
          initialized: (state) {
            // Инициализировано
            initSub?.cancel();
            initBloc.close();

            binding.addPostFrameCallback((_) {
              // Closes splash screen, and show the app layout.
              binding.allowFirstFrame();

              final context = binding.renderViewElement;
              if (context is BuildContext) {
                initializationCompleter.complete(context);
              } else {
                initializationCompleter.completeError(
                  UnsupportedError(
                    'No context after successful initialization',
                  ),
                  StackTrace.current,
                );
              }
            });

            // Запустить построение виджетов
            runApp(App(repositoryStorage: state.result));

            if (onSuccessfulInitialization != null) {
              Future<void>.delayed(
                Duration.zero,
                () => onSuccessfulInitialization(state.result),
              );
            }
          },
        ),
        cancelOnError: false,
        onDone: stopwatch.stop,
      );
    } on Object catch (error, stackTrace) {
      initializationCompleter.completeError(error, stackTrace);
    }
    return initializationCompleter.future;
  }

  /// Запустить построение виджетов
  static void run({
    required RepositoryStorage repositoryStorage,
  }) =>
      runApp(
        App(repositoryStorage: repositoryStorage),
      );

  final RepositoryStorage _repositoryStorage;

  @override
  Widget build(BuildContext context) => RepositoryScope(
        repositoryStorage: _repositoryStorage,
        builder: (context) => const AppMaterialContext(),
      );
}
