// ignore_for_file: comment_references

import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:l/l.dart';
import 'package:textly/src/common/initialization/model/initialization_helper.dart';
import 'package:textly/src/common/initialization/model/repository_storage.dart';

part 'initialization_bloc.freezed.dart';

@freezed
class InitializationEvent with _$InitializationEvent {
  const InitializationEvent._();

  const factory InitializationEvent.initialize() = _InitializeApp;
}

@freezed
class InitializationState with _$InitializationState {
  /// Произошла ошибка инициализации
  const factory InitializationState.error({
    required String message,
    required Object error,
    required StackTrace stackTrace,
  }) = _AppInitializationError;

  /// Инициализировано
  const factory InitializationState.initialized({
    required RepositoryStorage result,
  }) = _AppInitialized;

  /// Прогресс инициализации
  /// [percent] - процент инициализации, от 0 до 100
  /// [status] - статус инициализации, сообщение о задании
  const factory InitializationState.initializationInProgress({
    required int progress,
    required String message,
  }) = _AppInitializationInProgress;
  const InitializationState._();

  bool get isInitialized => maybeMap<bool>(
        orElse: () => false,
        initialized: (_) => true,
      );

  bool get isNotInitialized => !isInitialized;
}

class InitializationBLoC
    extends Bloc<InitializationEvent, InitializationState> {
  InitializationBLoC({
    required InitializationHelper initializationHelper,
    InitializationState initialState =
        const InitializationState.initializationInProgress(
      progress: 0,
      message: 'Preparing for initialization',
    ),
  })  : _initializationHelper = initializationHelper,
        super(initialState) {
    on<InitializationEvent>(_init);
  }
  final InitializationHelper _initializationHelper;

  Future<void> _init(
    InitializationEvent event,
    Emitter<InitializationState> emit,
  ) async {
    try {
      if (state.isInitialized || _initializationHelper.isInitialized) {
        emit(
          InitializationState.initialized(
            result: _initializationHelper.getResult(),
          ),
        );
      }
      _initializationHelper.reset();

      await _initializationHelper
          .initialize()
          .map<InitializationState>(
            (value) => InitializationState.initializationInProgress(
              progress: value.progress,
              message: value.message,
            ),
          )
          .forEach((action) {
        l.i(
          action.mapOrNull(
                initializationInProgress: (state) =>
                    '''Initialization progress ${state.progress}: ${state.message} ''',
              ) ??
              '',
        );
        emit(action);
      });
      emit(
        InitializationState.initialized(
          result: _initializationHelper.getResult(),
        ),
      );
    } on Object catch (error, stackTrace) {
      // Произошла непредвиденная ошибка
      emit(
        InitializationState.error(
          message: 'Unsupported initialization error',
          error: error,
          stackTrace: stackTrace,
        ),
      );
      rethrow;
    }
  }
}
