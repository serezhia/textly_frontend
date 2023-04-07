import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textly/src/common/widgets/repostiory_scope.dart';
import 'package:textly/src/feature/auth/bloc/auth_bloc.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';

@immutable
class AuthenticationScope extends StatefulWidget {
  const AuthenticationScope({
    required this.child,
    super.key,
  });

  final Widget child;

  /// Find _AuthenticationScopeState in BuildContext
  static _AuthenticationScopeState? _of(
    BuildContext context, {
    bool listen = false,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_InheritedAuthentication>()
          ?.state;
    } else {
      final inheritedWidget = context
          .getElementForInheritedWidgetOfExactType<_InheritedAuthentication>()
          ?.widget;
      return inheritedWidget is _InheritedAuthentication
          ? inheritedWidget.state
          : null;
    }
  }

  /// Получить пользователя из контекста
  static UserEntity userOf(BuildContext context, {bool listen = false}) {
    if (listen) {
      return context
              .dependOnInheritedWidgetOfExactType<_InheritedAuthentication>()
              ?.userEntity ??
          const UserEntity.notAuthenticated();
    } else {
      final inheritedWidget = context
          .getElementForInheritedWidgetOfExactType<_InheritedAuthentication>()
          ?.widget;
      return inheritedWidget is _InheritedAuthentication
          ? inheritedWidget.userEntity
          : const UserEntity.notAuthenticated();
    }
  }

  /// Проверить, совпадает ли идентификатор с текущим пользователем
  static bool isSameUid(
    BuildContext context,
    int userId, {
    bool listen = false,
  }) =>
      userOf(
        context,
        listen: listen,
      ).when<bool>(
        authenticated: (user) => user.userId == userId,
        notAuthenticated: () => false,
      );

  /// Проверить, авторизован ли текущий пользователь
  static bool isAuthenticatedOf(BuildContext context, {bool listen = false}) =>
      userOf(
        context,
        listen: listen,
      ).isAuthenticated;

  /// Проверить, авторизован ли текущий пользователь учитывая профиль
  static bool isAuthenticatedWithProfileOf(
    BuildContext context, {
    bool listen = false,
  }) =>
      userOf(
        context,
        listen: listen,
      ).isAuthenticatedWithProfile;

  /// Получить авторизованного пользователя из контекста или null
  static UserEntity? authenticatedOrNullOf(
    BuildContext context, {
    bool listen = false,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_InheritedAuthentication>()
          ?.userEntity
          .userOrNull;
    } else {
      final inheritedWidget = context
          .getElementForInheritedWidgetOfExactType<_InheritedAuthentication>()
          ?.widget;
      return inheritedWidget is _InheritedAuthentication
          ? inheritedWidget.userEntity.userOrNull
          : null;
    }
  }

  /// Получить авторизованного пользователя c профилем из контекста или null
  static UserEntity? authenticatedWithProfileOrNullOf(
    BuildContext context, {
    bool listen = false,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<_InheritedAuthentication>()
          ?.userEntity
          .userWithProfileOrNull;
    } else {
      final inheritedWidget = context
          .getElementForInheritedWidgetOfExactType<_InheritedAuthentication>()
          ?.widget;
      return inheritedWidget is _InheritedAuthentication
          ? inheritedWidget.userEntity.userWithProfileOrNull
          : null;
    }
  }

  /// Войти с помощью почты
  static void signInWithEmail(
    BuildContext context,
    String email,
    String code,
  ) =>
      _of(context)?.bloc.add(
            AuthenticationEvent.signInWithEmail(
              email: email,
              code: code,
            ),
          );

  /// Отправить код на почту
  static void sendCodeToEmail(
    BuildContext context,
    String email,
  ) =>
      _of(context)?.bloc.add(
            AuthenticationEvent.sendCodeToEmail(
              email: email,
            ),
          );

  /// создать профиль
  static void createProfile(
    BuildContext context,
    String username,
    String avatar,
    String backgroundColor,
    String nameProfile,
    String description,
  ) =>
      _of(context)?.bloc.add(
            AuthenticationEvent.createProfile(
              username: username,
              avatar: avatar,
              backgroundColor: backgroundColor,
              nameProfile: nameProfile,
              description: description,
            ),
          );

  /// Разлогиниться
  static void logOut(BuildContext context) =>
      _of(context)?.bloc.add(const AuthenticationEvent.logOut());

  @override
  State<AuthenticationScope> createState() => _AuthenticationScopeState();
}

class _AuthenticationScopeState extends State<AuthenticationScope> {
  late AuthenticationBLoC bloc;

  @override
  void initState() {
    super.initState();
    bloc = AuthenticationBLoC(
      authenticationRepository: RepositoryScope.of(context).authRepository,
      initialState: AuthenticationState.fromUser(
        RepositoryScope.of(context).authRepository.firstFetchUser,
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBLoC>.value(
      value: bloc,
      child: BlocBuilder<AuthenticationBLoC, AuthenticationState>(
        bloc: bloc,
        builder: (context, state) {
          return _InheritedAuthentication(
            state: this,
            userEntity: state.user,
            child: widget.child,
          );
        },
      ),
    );
  }
}

@immutable
class _InheritedAuthentication extends InheritedWidget {
  const _InheritedAuthentication({
    required this.state,
    required this.userEntity,
    required super.child,
  });
  final _AuthenticationScopeState state;
  final UserEntity userEntity;

  @override
  bool updateShouldNotify(_InheritedAuthentication oldWidget) =>
      userEntity != oldWidget.userEntity;
}
