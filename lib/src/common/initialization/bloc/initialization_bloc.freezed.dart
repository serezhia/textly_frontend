// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initialization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitializationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeApp value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeApp value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeApp value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationEventCopyWith<$Res> {
  factory $InitializationEventCopyWith(
          InitializationEvent value, $Res Function(InitializationEvent) then) =
      _$InitializationEventCopyWithImpl<$Res, InitializationEvent>;
}

/// @nodoc
class _$InitializationEventCopyWithImpl<$Res, $Val extends InitializationEvent>
    implements $InitializationEventCopyWith<$Res> {
  _$InitializationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializeAppCopyWith<$Res> {
  factory _$$_InitializeAppCopyWith(
          _$_InitializeApp value, $Res Function(_$_InitializeApp) then) =
      __$$_InitializeAppCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializeAppCopyWithImpl<$Res>
    extends _$InitializationEventCopyWithImpl<$Res, _$_InitializeApp>
    implements _$$_InitializeAppCopyWith<$Res> {
  __$$_InitializeAppCopyWithImpl(
      _$_InitializeApp _value, $Res Function(_$_InitializeApp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitializeApp extends _InitializeApp {
  const _$_InitializeApp() : super._();

  @override
  String toString() {
    return 'InitializationEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitializeApp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeApp value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeApp value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeApp value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _InitializeApp extends InitializationEvent {
  const factory _InitializeApp() = _$_InitializeApp;
  const _InitializeApp._() : super._();
}

/// @nodoc
mixin _$InitializationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, Object error, StackTrace stackTrace)
        error,
    required TResult Function(RepositoryStorage result) initialized,
    required TResult Function(int progress, String message)
        initializationInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult? Function(RepositoryStorage result)? initialized,
    TResult? Function(int progress, String message)? initializationInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult Function(RepositoryStorage result)? initialized,
    TResult Function(int progress, String message)? initializationInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppInitializationError value) error,
    required TResult Function(_AppInitialized value) initialized,
    required TResult Function(_AppInitializationInProgress value)
        initializationInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppInitializationError value)? error,
    TResult? Function(_AppInitialized value)? initialized,
    TResult? Function(_AppInitializationInProgress value)?
        initializationInProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppInitializationError value)? error,
    TResult Function(_AppInitialized value)? initialized,
    TResult Function(_AppInitializationInProgress value)?
        initializationInProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializationStateCopyWith<$Res> {
  factory $InitializationStateCopyWith(
          InitializationState value, $Res Function(InitializationState) then) =
      _$InitializationStateCopyWithImpl<$Res, InitializationState>;
}

/// @nodoc
class _$InitializationStateCopyWithImpl<$Res, $Val extends InitializationState>
    implements $InitializationStateCopyWith<$Res> {
  _$InitializationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AppInitializationErrorCopyWith<$Res> {
  factory _$$_AppInitializationErrorCopyWith(_$_AppInitializationError value,
          $Res Function(_$_AppInitializationError) then) =
      __$$_AppInitializationErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$_AppInitializationErrorCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$_AppInitializationError>
    implements _$$_AppInitializationErrorCopyWith<$Res> {
  __$$_AppInitializationErrorCopyWithImpl(_$_AppInitializationError _value,
      $Res Function(_$_AppInitializationError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$_AppInitializationError(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error ? _value.error : error,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$_AppInitializationError extends _AppInitializationError {
  const _$_AppInitializationError(
      {required this.message, required this.error, required this.stackTrace})
      : super._();

  @override
  final String message;
  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'InitializationState.error(message: $message, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppInitializationError &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message,
      const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppInitializationErrorCopyWith<_$_AppInitializationError> get copyWith =>
      __$$_AppInitializationErrorCopyWithImpl<_$_AppInitializationError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, Object error, StackTrace stackTrace)
        error,
    required TResult Function(RepositoryStorage result) initialized,
    required TResult Function(int progress, String message)
        initializationInProgress,
  }) {
    return error(message, this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult? Function(RepositoryStorage result)? initialized,
    TResult? Function(int progress, String message)? initializationInProgress,
  }) {
    return error?.call(message, this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult Function(RepositoryStorage result)? initialized,
    TResult Function(int progress, String message)? initializationInProgress,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppInitializationError value) error,
    required TResult Function(_AppInitialized value) initialized,
    required TResult Function(_AppInitializationInProgress value)
        initializationInProgress,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppInitializationError value)? error,
    TResult? Function(_AppInitialized value)? initialized,
    TResult? Function(_AppInitializationInProgress value)?
        initializationInProgress,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppInitializationError value)? error,
    TResult Function(_AppInitialized value)? initialized,
    TResult Function(_AppInitializationInProgress value)?
        initializationInProgress,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _AppInitializationError extends InitializationState {
  const factory _AppInitializationError(
      {required final String message,
      required final Object error,
      required final StackTrace stackTrace}) = _$_AppInitializationError;
  const _AppInitializationError._() : super._();

  String get message;
  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$_AppInitializationErrorCopyWith<_$_AppInitializationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppInitializedCopyWith<$Res> {
  factory _$$_AppInitializedCopyWith(
          _$_AppInitialized value, $Res Function(_$_AppInitialized) then) =
      __$$_AppInitializedCopyWithImpl<$Res>;
  @useResult
  $Res call({RepositoryStorage result});
}

/// @nodoc
class __$$_AppInitializedCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res, _$_AppInitialized>
    implements _$$_AppInitializedCopyWith<$Res> {
  __$$_AppInitializedCopyWithImpl(
      _$_AppInitialized _value, $Res Function(_$_AppInitialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
  }) {
    return _then(_$_AppInitialized(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as RepositoryStorage,
    ));
  }
}

/// @nodoc

class _$_AppInitialized extends _AppInitialized {
  const _$_AppInitialized({required this.result}) : super._();

  @override
  final RepositoryStorage result;

  @override
  String toString() {
    return 'InitializationState.initialized(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppInitialized &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppInitializedCopyWith<_$_AppInitialized> get copyWith =>
      __$$_AppInitializedCopyWithImpl<_$_AppInitialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, Object error, StackTrace stackTrace)
        error,
    required TResult Function(RepositoryStorage result) initialized,
    required TResult Function(int progress, String message)
        initializationInProgress,
  }) {
    return initialized(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult? Function(RepositoryStorage result)? initialized,
    TResult? Function(int progress, String message)? initializationInProgress,
  }) {
    return initialized?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult Function(RepositoryStorage result)? initialized,
    TResult Function(int progress, String message)? initializationInProgress,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppInitializationError value) error,
    required TResult Function(_AppInitialized value) initialized,
    required TResult Function(_AppInitializationInProgress value)
        initializationInProgress,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppInitializationError value)? error,
    TResult? Function(_AppInitialized value)? initialized,
    TResult? Function(_AppInitializationInProgress value)?
        initializationInProgress,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppInitializationError value)? error,
    TResult Function(_AppInitialized value)? initialized,
    TResult Function(_AppInitializationInProgress value)?
        initializationInProgress,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _AppInitialized extends InitializationState {
  const factory _AppInitialized({required final RepositoryStorage result}) =
      _$_AppInitialized;
  const _AppInitialized._() : super._();

  RepositoryStorage get result;
  @JsonKey(ignore: true)
  _$$_AppInitializedCopyWith<_$_AppInitialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AppInitializationInProgressCopyWith<$Res> {
  factory _$$_AppInitializationInProgressCopyWith(
          _$_AppInitializationInProgress value,
          $Res Function(_$_AppInitializationInProgress) then) =
      __$$_AppInitializationInProgressCopyWithImpl<$Res>;
  @useResult
  $Res call({int progress, String message});
}

/// @nodoc
class __$$_AppInitializationInProgressCopyWithImpl<$Res>
    extends _$InitializationStateCopyWithImpl<$Res,
        _$_AppInitializationInProgress>
    implements _$$_AppInitializationInProgressCopyWith<$Res> {
  __$$_AppInitializationInProgressCopyWithImpl(
      _$_AppInitializationInProgress _value,
      $Res Function(_$_AppInitializationInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? message = null,
  }) {
    return _then(_$_AppInitializationInProgress(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppInitializationInProgress extends _AppInitializationInProgress {
  const _$_AppInitializationInProgress(
      {required this.progress, required this.message})
      : super._();

  @override
  final int progress;
  @override
  final String message;

  @override
  String toString() {
    return 'InitializationState.initializationInProgress(progress: $progress, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppInitializationInProgress &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppInitializationInProgressCopyWith<_$_AppInitializationInProgress>
      get copyWith => __$$_AppInitializationInProgressCopyWithImpl<
          _$_AppInitializationInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message, Object error, StackTrace stackTrace)
        error,
    required TResult Function(RepositoryStorage result) initialized,
    required TResult Function(int progress, String message)
        initializationInProgress,
  }) {
    return initializationInProgress(progress, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult? Function(RepositoryStorage result)? initialized,
    TResult? Function(int progress, String message)? initializationInProgress,
  }) {
    return initializationInProgress?.call(progress, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, Object error, StackTrace stackTrace)?
        error,
    TResult Function(RepositoryStorage result)? initialized,
    TResult Function(int progress, String message)? initializationInProgress,
    required TResult orElse(),
  }) {
    if (initializationInProgress != null) {
      return initializationInProgress(progress, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AppInitializationError value) error,
    required TResult Function(_AppInitialized value) initialized,
    required TResult Function(_AppInitializationInProgress value)
        initializationInProgress,
  }) {
    return initializationInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AppInitializationError value)? error,
    TResult? Function(_AppInitialized value)? initialized,
    TResult? Function(_AppInitializationInProgress value)?
        initializationInProgress,
  }) {
    return initializationInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AppInitializationError value)? error,
    TResult Function(_AppInitialized value)? initialized,
    TResult Function(_AppInitializationInProgress value)?
        initializationInProgress,
    required TResult orElse(),
  }) {
    if (initializationInProgress != null) {
      return initializationInProgress(this);
    }
    return orElse();
  }
}

abstract class _AppInitializationInProgress extends InitializationState {
  const factory _AppInitializationInProgress(
      {required final int progress,
      required final String message}) = _$_AppInitializationInProgress;
  const _AppInitializationInProgress._() : super._();

  int get progress;
  String get message;
  @JsonKey(ignore: true)
  _$$_AppInitializationInProgressCopyWith<_$_AppInitializationInProgress>
      get copyWith => throw _privateConstructorUsedError;
}
