// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:textly_core/textly_core.dart';

@immutable
abstract class UserEntity {
  const factory UserEntity.authenticated({
    required int userId,
    required String email,
    required OAuth2Token tokens,
    required bool withProfile,
  }) = AuthenticatedUser;

  const factory UserEntity.notAuthenticated({String? email}) =
      NotAuthenticatedUser;

  bool get withProfile;

  bool get isAuthenticated;
  bool get isAuthenticatedWithProfile;
  bool get isNotAuthenticated;

  UserEntity? get userWithProfileOrNull;
  UserEntity? get userOrNull;
  int? get userId;
  OAuth2Token? get tokens;
  String? get email;

  T when<T extends Object?>({
    required T Function(AuthenticatedUser user) authenticated,
    required T Function() notAuthenticated,
  });
}

class NotAuthenticatedUser implements UserEntity {
  const NotAuthenticatedUser({this.email});
  @override
  bool get isAuthenticated => false;

  @override
  bool get isNotAuthenticated => !isAuthenticated;

  @override
  String toString() => 'User is not authenticated';

  @override
  bool operator ==(Object other) => other is NotAuthenticatedUser;

  @override
  int get hashCode => 0;

  @override
  bool get withProfile => false;

  @override
  int? get userId => null;

  @override
  OAuth2Token? get tokens => null;

  @override
  final String? email;

  @override
  bool get isAuthenticatedWithProfile => false;

  @override
  UserEntity? get userOrNull => null;

  @override
  UserEntity? get userWithProfileOrNull => null;

  @override
  T when<T extends Object?>({
    required T Function(AuthenticatedUser user) authenticated,
    required T Function() notAuthenticated,
  }) =>
      notAuthenticated();
}

class AuthenticatedUser implements UserEntity {
  @literal
  const AuthenticatedUser({
    required this.userId,
    required this.email,
    required this.tokens,
    required this.withProfile,
  });

  @override
  final int userId;

  @override
  final String email;

  @override
  final OAuth2Token tokens;

  @override
  final bool withProfile;

  @override
  bool get isAuthenticated => true;

  @override
  bool get isNotAuthenticated => !isAuthenticated;

  @override
  String toString() => withProfile
      ? 'User with profile is authenticated'
      : 'User without profile is authenticated';

  @override
  bool operator ==(Object other) => other is AuthenticatedUser;

  @override
  int get hashCode => 0;

  @override
  bool get isAuthenticatedWithProfile => withProfile;

  @override
  UserEntity? get userOrNull => this;

  @override
  UserEntity? get userWithProfileOrNull => withProfile ? this : null;

  @override
  T when<T extends Object?>({
    required T Function(AuthenticatedUser user) authenticated,
    required T Function() notAuthenticated,
  }) =>
      authenticated(this);
}
