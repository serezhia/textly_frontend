import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:l/l.dart';
import 'package:textly/src/common/utils/bloc_util.dart';
import 'package:textly/src/feature/auth/data/auth_repo.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';
import 'package:textly_core/textly_core.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const AuthenticationEvent._();

  /// Войти с помощью почты
  @literal
  const factory AuthenticationEvent.signInWithEmail({
    required String email,
    required String code,
  }) = _SignInWithEmailEvent;

  const factory AuthenticationEvent.sendCodeToEmail({
    required String email,
  }) = _SendCodeToEmailEvent;

  const factory AuthenticationEvent.createProfile({
    required String username,
    required String avatar,
    required String backgroundColor,
    required String nameProfile,
    required String description,
  }) = _CreateProfileEvent;

  /// Разлогиниться
  @literal
  const factory AuthenticationEvent.logOut() = _LogOutEvent;
}

@freezed
class AuthenticationState with _$AuthenticationState {
  /// Ошибка в процессе аутентификации
  const factory AuthenticationState.error({
    @Default(NotAuthenticatedUser()) UserEntity user,
    @Default('An error occurred during authentication') String message,
  }) = _ErrorAuthenticationState;

  /// Аутентифицирован без профиля
  factory AuthenticationState.authenticatedWithoutProfile({
    required UserEntity user,
  }) = _AuthenticatedWithoutProfileState;

  /// Аутентифицирован с профилем
  factory AuthenticationState.authenticatedWithProfile({
    required UserEntity user,
  }) = _AuthenticatedState;

  /// Находимся в процессе аутентификации
  const factory AuthenticationState.progress({required UserEntity user}) =
      _AuthenticationInProgressState;

  /// Разлогинен / Не аутентифицирован
  @literal
  const factory AuthenticationState.notAuthenticatedWithCode({
    @Default(NotAuthenticatedUser()) NotAuthenticatedUser user,
  }) = _NotAuthenticatedWithCodeState;

  @literal
  const factory AuthenticationState.notAuthenticated({
    @Default(NotAuthenticatedUser()) NotAuthenticatedUser user,
  }) = _NotAuthenticatedState;

  const AuthenticationState._();

  @override
  UserEntity get user => super.map<UserEntity>(
        notAuthenticated: (_) => const NotAuthenticatedUser(),
        notAuthenticatedWithCode: (_) => const NotAuthenticatedUser(),
        progress: (state) => state.user,
        authenticatedWithProfile: (state) => state.user,
        authenticatedWithoutProfile: (state) => state.user,
        error: (state) => state.user,
      );

  bool get isAuthenticated => user.isAuthenticated;

  bool get isNotAuthenticated => !isAuthenticated;

  bool get withProfile => user.withProfile;

  bool get hasError => maybeMap<bool>(orElse: () => false, error: (_) => true);

  bool get inProgress => maybeMap<bool>(
        authenticatedWithProfile: (_) => false,
        orElse: () => true,
      );

  @factory
  // ignore: prefer_constructors_over_static_methods, invalid_factory_method_impl
  static AuthenticationState fromUser(UserEntity user) =>
      user.when<AuthenticationState>(
        authenticated: (user) {
          if (user.withProfile) {
            return AuthenticationState.authenticatedWithProfile(user: user);
          } else {
            return AuthenticationState.authenticatedWithoutProfile(user: user);
          }
        },
        notAuthenticated: () {
          if (user.email != null) {
            return AuthenticationState.notAuthenticatedWithCode(
              user: NotAuthenticatedUser(email: user.email),
            );
          } else {
            return const AuthenticationState.notAuthenticated();
          }
        },
      );
}

class AuthenticationBLoC extends Bloc<AuthenticationEvent, AuthenticationState>
    with SetStateMixin<AuthenticationState> {
  AuthenticationBLoC({
    required IAuthRepository authenticationRepository,
    required AuthenticationState initialState,
  })  : _authenticationRepository = authenticationRepository,
        super(initialState) {
    on<_SignInWithEmailEvent>(
      (event, emit) => _signInWithEmail(emit, event),
      transformer: bloc_concurrency.droppable(),
    );
    on<_LogOutEvent>(
      (event, emit) => _logOut(emit),
      transformer: bloc_concurrency.droppable(),
    );
    on<_CreateProfileEvent>(
      (event, emit) => _createProfile(emit, event),
      transformer: bloc_concurrency.droppable(),
    );
    on<_SendCodeToEmailEvent>(
      (event, emit) => _sendCode(emit, event),
      transformer: bloc_concurrency.droppable(),
    );
  }

  final IAuthRepository _authenticationRepository;

  Future<void> _signInWithEmail(
    Emitter<AuthenticationState> emit,
    _SignInWithEmailEvent event,
  ) async {
    if (state.isAuthenticated) return;
    l.vvvvvv('Начат процесс аутентификации через почту');
    emit(AuthenticationState.progress(user: state.user));
    try {
      l.vvvvvv('Запросим у репозитория аутентификации аутентификацию в гугле');
      final user = await _authenticationRepository.signInWithEmail(
        email: event.email,
        code: event.code,
      );
      emit(AuthenticationState.fromUser(user));
    } on Object catch (error, stackTrace) {
      l.w('Во время аутентификации произошла ошибка: $error', stackTrace);
      emit(
        const AuthenticationState.error(
          message: 'Error signin',
        ),
      );
      emit(const AuthenticationState.notAuthenticatedWithCode());
      rethrow;
    }
  }

  Future<void> _logOut(Emitter<AuthenticationState> emit) async {
    if (state.isNotAuthenticated) return;
    l.vvvvvv('Начат процесс разлогинивания');
    emit(AuthenticationState.progress(user: state.user));
    try {
      await _authenticationRepository.logOut();
      emit(AuthenticationState.fromUser(const NotAuthenticatedUser()));
    } on Object {
      l.w('Во время разлогина произошла ошибка');
      emit(
        const AuthenticationState.error(
          message: 'Error logout',
        ),
      );
      emit(AuthenticationState.fromUser(const NotAuthenticatedUser()));
      rethrow;
    }
  }

  Future<void> _sendCode(
    Emitter<AuthenticationState> emit,
    _SendCodeToEmailEvent event,
  ) async {
    if (state.isAuthenticated) return;
    l.vvvvvv('Начат процесс отправки кода авторизации');
    emit(AuthenticationState.progress(user: state.user));
    try {
      final newUser =
          await _authenticationRepository.sendEmailCode(email: event.email);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(AuthenticationState.fromUser(newUser));
    } on Object {
      l.w('Во время отправки кода произошла ошибка');
      emit(
        const AuthenticationState.error(
          message: 'Error send code',
        ),
      );
      emit(AuthenticationState.fromUser(const NotAuthenticatedUser()));
      rethrow;
    }
  }

  Future<void> _createProfile(
    Emitter<AuthenticationState> emit,
    _CreateProfileEvent event,
  ) async {
    if (state.isNotAuthenticated || state.user.userId == null) return;

    l.vvvvvv('Начат процесс создания аккаунта');
    emit(AuthenticationState.progress(user: state.user));
    try {
      final user = await _authenticationRepository.createProfile(
        profile: Profile(
          userId: state.user.userId!,
          username: event.username,
          profileName: event.nameProfile,
          avatar: event.avatar,
          backgroundColor: event.backgroundColor,
          description: event.description,
          isPremium: false,
          isDelete: false,
        ),
      );
      emit(AuthenticationState.fromUser(user));
      l.vvvvvv('Профиль для аккаунта создан ');
    } on Object {
      l.w('Во время создания аккаунта произошла ошибка');
      emit(
        const AuthenticationState.error(
          message: 'Error create account',
        ),
      );
      emit(
        AuthenticationState.fromUser(
          await _authenticationRepository.userFromStorage(),
        ),
      );
      rethrow;
    }
  }
}
