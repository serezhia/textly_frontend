// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String code) signInWithEmail,
    required TResult Function(String email) sendCodeToEmail,
    required TResult Function(String username, String avatar,
            String backgroundColor, String nameProfile, String description)
        createProfile,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String code)? signInWithEmail,
    TResult? Function(String email)? sendCodeToEmail,
    TResult? Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult? Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String code)? signInWithEmail,
    TResult Function(String email)? sendCodeToEmail,
    TResult Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_SendCodeToEmailEvent value) sendCodeToEmail,
    required TResult Function(_CreateProfileEvent value) createProfile,
    required TResult Function(_LogOutEvent value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult? Function(_CreateProfileEvent value)? createProfile,
    TResult? Function(_LogOutEvent value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult Function(_CreateProfileEvent value)? createProfile,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignInWithEmailEventCopyWith<$Res> {
  factory _$$_SignInWithEmailEventCopyWith(_$_SignInWithEmailEvent value,
          $Res Function(_$_SignInWithEmailEvent) then) =
      __$$_SignInWithEmailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$$_SignInWithEmailEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_SignInWithEmailEvent>
    implements _$$_SignInWithEmailEventCopyWith<$Res> {
  __$$_SignInWithEmailEventCopyWithImpl(_$_SignInWithEmailEvent _value,
      $Res Function(_$_SignInWithEmailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_$_SignInWithEmailEvent(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@literal
class _$_SignInWithEmailEvent extends _SignInWithEmailEvent {
  const _$_SignInWithEmailEvent({required this.email, required this.code})
      : super._();

  @override
  final String email;
  @override
  final String code;

  @override
  String toString() {
    return 'AuthenticationEvent.signInWithEmail(email: $email, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithEmailEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithEmailEventCopyWith<_$_SignInWithEmailEvent> get copyWith =>
      __$$_SignInWithEmailEventCopyWithImpl<_$_SignInWithEmailEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String code) signInWithEmail,
    required TResult Function(String email) sendCodeToEmail,
    required TResult Function(String username, String avatar,
            String backgroundColor, String nameProfile, String description)
        createProfile,
    required TResult Function() logOut,
  }) {
    return signInWithEmail(email, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String code)? signInWithEmail,
    TResult? Function(String email)? sendCodeToEmail,
    TResult? Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult? Function()? logOut,
  }) {
    return signInWithEmail?.call(email, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String code)? signInWithEmail,
    TResult Function(String email)? sendCodeToEmail,
    TResult Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(email, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_SendCodeToEmailEvent value) sendCodeToEmail,
    required TResult Function(_CreateProfileEvent value) createProfile,
    required TResult Function(_LogOutEvent value) logOut,
  }) {
    return signInWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult? Function(_CreateProfileEvent value)? createProfile,
    TResult? Function(_LogOutEvent value)? logOut,
  }) {
    return signInWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult Function(_CreateProfileEvent value)? createProfile,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmailEvent extends AuthenticationEvent {
  const factory _SignInWithEmailEvent(
      {required final String email,
      required final String code}) = _$_SignInWithEmailEvent;
  const _SignInWithEmailEvent._() : super._();

  String get email;
  String get code;
  @JsonKey(ignore: true)
  _$$_SignInWithEmailEventCopyWith<_$_SignInWithEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendCodeToEmailEventCopyWith<$Res> {
  factory _$$_SendCodeToEmailEventCopyWith(_$_SendCodeToEmailEvent value,
          $Res Function(_$_SendCodeToEmailEvent) then) =
      __$$_SendCodeToEmailEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_SendCodeToEmailEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_SendCodeToEmailEvent>
    implements _$$_SendCodeToEmailEventCopyWith<$Res> {
  __$$_SendCodeToEmailEventCopyWithImpl(_$_SendCodeToEmailEvent _value,
      $Res Function(_$_SendCodeToEmailEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_SendCodeToEmailEvent(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SendCodeToEmailEvent extends _SendCodeToEmailEvent {
  const _$_SendCodeToEmailEvent({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'AuthenticationEvent.sendCodeToEmail(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendCodeToEmailEvent &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendCodeToEmailEventCopyWith<_$_SendCodeToEmailEvent> get copyWith =>
      __$$_SendCodeToEmailEventCopyWithImpl<_$_SendCodeToEmailEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String code) signInWithEmail,
    required TResult Function(String email) sendCodeToEmail,
    required TResult Function(String username, String avatar,
            String backgroundColor, String nameProfile, String description)
        createProfile,
    required TResult Function() logOut,
  }) {
    return sendCodeToEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String code)? signInWithEmail,
    TResult? Function(String email)? sendCodeToEmail,
    TResult? Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult? Function()? logOut,
  }) {
    return sendCodeToEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String code)? signInWithEmail,
    TResult Function(String email)? sendCodeToEmail,
    TResult Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (sendCodeToEmail != null) {
      return sendCodeToEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_SendCodeToEmailEvent value) sendCodeToEmail,
    required TResult Function(_CreateProfileEvent value) createProfile,
    required TResult Function(_LogOutEvent value) logOut,
  }) {
    return sendCodeToEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult? Function(_CreateProfileEvent value)? createProfile,
    TResult? Function(_LogOutEvent value)? logOut,
  }) {
    return sendCodeToEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult Function(_CreateProfileEvent value)? createProfile,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (sendCodeToEmail != null) {
      return sendCodeToEmail(this);
    }
    return orElse();
  }
}

abstract class _SendCodeToEmailEvent extends AuthenticationEvent {
  const factory _SendCodeToEmailEvent({required final String email}) =
      _$_SendCodeToEmailEvent;
  const _SendCodeToEmailEvent._() : super._();

  String get email;
  @JsonKey(ignore: true)
  _$$_SendCodeToEmailEventCopyWith<_$_SendCodeToEmailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreateProfileEventCopyWith<$Res> {
  factory _$$_CreateProfileEventCopyWith(_$_CreateProfileEvent value,
          $Res Function(_$_CreateProfileEvent) then) =
      __$$_CreateProfileEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String username,
      String avatar,
      String backgroundColor,
      String nameProfile,
      String description});
}

/// @nodoc
class __$$_CreateProfileEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_CreateProfileEvent>
    implements _$$_CreateProfileEventCopyWith<$Res> {
  __$$_CreateProfileEventCopyWithImpl(
      _$_CreateProfileEvent _value, $Res Function(_$_CreateProfileEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? avatar = null,
    Object? backgroundColor = null,
    Object? nameProfile = null,
    Object? description = null,
  }) {
    return _then(_$_CreateProfileEvent(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String,
      nameProfile: null == nameProfile
          ? _value.nameProfile
          : nameProfile // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateProfileEvent extends _CreateProfileEvent {
  const _$_CreateProfileEvent(
      {required this.username,
      required this.avatar,
      required this.backgroundColor,
      required this.nameProfile,
      required this.description})
      : super._();

  @override
  final String username;
  @override
  final String avatar;
  @override
  final String backgroundColor;
  @override
  final String nameProfile;
  @override
  final String description;

  @override
  String toString() {
    return 'AuthenticationEvent.createProfile(username: $username, avatar: $avatar, backgroundColor: $backgroundColor, nameProfile: $nameProfile, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateProfileEvent &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.nameProfile, nameProfile) ||
                other.nameProfile == nameProfile) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, username, avatar, backgroundColor, nameProfile, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateProfileEventCopyWith<_$_CreateProfileEvent> get copyWith =>
      __$$_CreateProfileEventCopyWithImpl<_$_CreateProfileEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String code) signInWithEmail,
    required TResult Function(String email) sendCodeToEmail,
    required TResult Function(String username, String avatar,
            String backgroundColor, String nameProfile, String description)
        createProfile,
    required TResult Function() logOut,
  }) {
    return createProfile(
        username, avatar, backgroundColor, nameProfile, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String code)? signInWithEmail,
    TResult? Function(String email)? sendCodeToEmail,
    TResult? Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult? Function()? logOut,
  }) {
    return createProfile?.call(
        username, avatar, backgroundColor, nameProfile, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String code)? signInWithEmail,
    TResult Function(String email)? sendCodeToEmail,
    TResult Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (createProfile != null) {
      return createProfile(
          username, avatar, backgroundColor, nameProfile, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_SendCodeToEmailEvent value) sendCodeToEmail,
    required TResult Function(_CreateProfileEvent value) createProfile,
    required TResult Function(_LogOutEvent value) logOut,
  }) {
    return createProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult? Function(_CreateProfileEvent value)? createProfile,
    TResult? Function(_LogOutEvent value)? logOut,
  }) {
    return createProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult Function(_CreateProfileEvent value)? createProfile,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (createProfile != null) {
      return createProfile(this);
    }
    return orElse();
  }
}

abstract class _CreateProfileEvent extends AuthenticationEvent {
  const factory _CreateProfileEvent(
      {required final String username,
      required final String avatar,
      required final String backgroundColor,
      required final String nameProfile,
      required final String description}) = _$_CreateProfileEvent;
  const _CreateProfileEvent._() : super._();

  String get username;
  String get avatar;
  String get backgroundColor;
  String get nameProfile;
  String get description;
  @JsonKey(ignore: true)
  _$$_CreateProfileEventCopyWith<_$_CreateProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LogOutEventCopyWith<$Res> {
  factory _$$_LogOutEventCopyWith(
          _$_LogOutEvent value, $Res Function(_$_LogOutEvent) then) =
      __$$_LogOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogOutEventCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$_LogOutEvent>
    implements _$$_LogOutEventCopyWith<$Res> {
  __$$_LogOutEventCopyWithImpl(
      _$_LogOutEvent _value, $Res Function(_$_LogOutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

@literal
class _$_LogOutEvent extends _LogOutEvent {
  const _$_LogOutEvent() : super._();

  @override
  String toString() {
    return 'AuthenticationEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogOutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String code) signInWithEmail,
    required TResult Function(String email) sendCodeToEmail,
    required TResult Function(String username, String avatar,
            String backgroundColor, String nameProfile, String description)
        createProfile,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String code)? signInWithEmail,
    TResult? Function(String email)? sendCodeToEmail,
    TResult? Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult? Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String code)? signInWithEmail,
    TResult Function(String email)? sendCodeToEmail,
    TResult Function(String username, String avatar, String backgroundColor,
            String nameProfile, String description)?
        createProfile,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmailEvent value) signInWithEmail,
    required TResult Function(_SendCodeToEmailEvent value) sendCodeToEmail,
    required TResult Function(_CreateProfileEvent value) createProfile,
    required TResult Function(_LogOutEvent value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult? Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult? Function(_CreateProfileEvent value)? createProfile,
    TResult? Function(_LogOutEvent value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmailEvent value)? signInWithEmail,
    TResult Function(_SendCodeToEmailEvent value)? sendCodeToEmail,
    TResult Function(_CreateProfileEvent value)? createProfile,
    TResult Function(_LogOutEvent value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOutEvent extends AuthenticationEvent {
  const factory _LogOutEvent() = _$_LogOutEvent;
  const _LogOutEvent._() : super._();
}

/// @nodoc
mixin _$AuthenticationState {
  UserEntity get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) authenticatedWithoutProfile,
    required TResult Function(UserEntity user) authenticatedWithProfile,
    required TResult Function(UserEntity user) progress,
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? authenticatedWithoutProfile,
    TResult? Function(UserEntity user)? authenticatedWithProfile,
    TResult? Function(UserEntity user)? progress,
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? authenticatedWithoutProfile,
    TResult Function(UserEntity user)? authenticatedWithProfile,
    TResult Function(UserEntity user)? progress,
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorAuthenticationState value) error,
    required TResult Function(_AuthenticatedWithoutProfileState value)
        authenticatedWithoutProfile,
    required TResult Function(_AuthenticatedState value)
        authenticatedWithProfile,
    required TResult Function(_AuthenticationInProgressState value) progress,
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorAuthenticationState value)? error,
    TResult? Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult? Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult? Function(_AuthenticationInProgressState value)? progress,
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorAuthenticationState value)? error,
    TResult Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult Function(_AuthenticationInProgressState value)? progress,
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ErrorAuthenticationStateCopyWith<$Res> {
  factory _$$_ErrorAuthenticationStateCopyWith(
          _$_ErrorAuthenticationState value,
          $Res Function(_$_ErrorAuthenticationState) then) =
      __$$_ErrorAuthenticationStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user, String message});
}

/// @nodoc
class __$$_ErrorAuthenticationStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_ErrorAuthenticationState>
    implements _$$_ErrorAuthenticationStateCopyWith<$Res> {
  __$$_ErrorAuthenticationStateCopyWithImpl(_$_ErrorAuthenticationState _value,
      $Res Function(_$_ErrorAuthenticationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? message = null,
  }) {
    return _then(_$_ErrorAuthenticationState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorAuthenticationState extends _ErrorAuthenticationState {
  const _$_ErrorAuthenticationState(
      {this.user = const NotAuthenticatedUser(),
      this.message = 'An error occurred during authentication'})
      : super._();

  @override
  @JsonKey()
  final UserEntity user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.error(user: $user, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorAuthenticationState &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorAuthenticationStateCopyWith<_$_ErrorAuthenticationState>
      get copyWith => __$$_ErrorAuthenticationStateCopyWithImpl<
          _$_ErrorAuthenticationState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) authenticatedWithoutProfile,
    required TResult Function(UserEntity user) authenticatedWithProfile,
    required TResult Function(UserEntity user) progress,
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
  }) {
    return error(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? authenticatedWithoutProfile,
    TResult? Function(UserEntity user)? authenticatedWithProfile,
    TResult? Function(UserEntity user)? progress,
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
  }) {
    return error?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? authenticatedWithoutProfile,
    TResult Function(UserEntity user)? authenticatedWithProfile,
    TResult Function(UserEntity user)? progress,
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorAuthenticationState value) error,
    required TResult Function(_AuthenticatedWithoutProfileState value)
        authenticatedWithoutProfile,
    required TResult Function(_AuthenticatedState value)
        authenticatedWithProfile,
    required TResult Function(_AuthenticationInProgressState value) progress,
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorAuthenticationState value)? error,
    TResult? Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult? Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult? Function(_AuthenticationInProgressState value)? progress,
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorAuthenticationState value)? error,
    TResult Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult Function(_AuthenticationInProgressState value)? progress,
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorAuthenticationState extends AuthenticationState {
  const factory _ErrorAuthenticationState(
      {final UserEntity user,
      final String message}) = _$_ErrorAuthenticationState;
  const _ErrorAuthenticationState._() : super._();

  @override
  UserEntity get user;
  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorAuthenticationStateCopyWith<_$_ErrorAuthenticationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthenticatedWithoutProfileStateCopyWith<$Res> {
  factory _$$_AuthenticatedWithoutProfileStateCopyWith(
          _$_AuthenticatedWithoutProfileState value,
          $Res Function(_$_AuthenticatedWithoutProfileState) then) =
      __$$_AuthenticatedWithoutProfileStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_AuthenticatedWithoutProfileStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$_AuthenticatedWithoutProfileState>
    implements _$$_AuthenticatedWithoutProfileStateCopyWith<$Res> {
  __$$_AuthenticatedWithoutProfileStateCopyWithImpl(
      _$_AuthenticatedWithoutProfileState _value,
      $Res Function(_$_AuthenticatedWithoutProfileState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthenticatedWithoutProfileState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_AuthenticatedWithoutProfileState
    extends _AuthenticatedWithoutProfileState {
  _$_AuthenticatedWithoutProfileState({required this.user}) : super._();

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'AuthenticationState.authenticatedWithoutProfile(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatedWithoutProfileState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedWithoutProfileStateCopyWith<
          _$_AuthenticatedWithoutProfileState>
      get copyWith => __$$_AuthenticatedWithoutProfileStateCopyWithImpl<
          _$_AuthenticatedWithoutProfileState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) authenticatedWithoutProfile,
    required TResult Function(UserEntity user) authenticatedWithProfile,
    required TResult Function(UserEntity user) progress,
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
  }) {
    return authenticatedWithoutProfile(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? authenticatedWithoutProfile,
    TResult? Function(UserEntity user)? authenticatedWithProfile,
    TResult? Function(UserEntity user)? progress,
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
  }) {
    return authenticatedWithoutProfile?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? authenticatedWithoutProfile,
    TResult Function(UserEntity user)? authenticatedWithProfile,
    TResult Function(UserEntity user)? progress,
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticatedWithoutProfile != null) {
      return authenticatedWithoutProfile(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorAuthenticationState value) error,
    required TResult Function(_AuthenticatedWithoutProfileState value)
        authenticatedWithoutProfile,
    required TResult Function(_AuthenticatedState value)
        authenticatedWithProfile,
    required TResult Function(_AuthenticationInProgressState value) progress,
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
  }) {
    return authenticatedWithoutProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorAuthenticationState value)? error,
    TResult? Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult? Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult? Function(_AuthenticationInProgressState value)? progress,
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
  }) {
    return authenticatedWithoutProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorAuthenticationState value)? error,
    TResult Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult Function(_AuthenticationInProgressState value)? progress,
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticatedWithoutProfile != null) {
      return authenticatedWithoutProfile(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedWithoutProfileState extends AuthenticationState {
  factory _AuthenticatedWithoutProfileState({required final UserEntity user}) =
      _$_AuthenticatedWithoutProfileState;
  _AuthenticatedWithoutProfileState._() : super._();

  @override
  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedWithoutProfileStateCopyWith<
          _$_AuthenticatedWithoutProfileState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthenticatedStateCopyWith<$Res> {
  factory _$$_AuthenticatedStateCopyWith(_$_AuthenticatedState value,
          $Res Function(_$_AuthenticatedState) then) =
      __$$_AuthenticatedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_AuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_AuthenticatedState>
    implements _$$_AuthenticatedStateCopyWith<$Res> {
  __$$_AuthenticatedStateCopyWithImpl(
      _$_AuthenticatedState _value, $Res Function(_$_AuthenticatedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthenticatedState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_AuthenticatedState extends _AuthenticatedState {
  _$_AuthenticatedState({required this.user}) : super._();

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'AuthenticationState.authenticatedWithProfile(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatedState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatedStateCopyWith<_$_AuthenticatedState> get copyWith =>
      __$$_AuthenticatedStateCopyWithImpl<_$_AuthenticatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) authenticatedWithoutProfile,
    required TResult Function(UserEntity user) authenticatedWithProfile,
    required TResult Function(UserEntity user) progress,
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
  }) {
    return authenticatedWithProfile(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? authenticatedWithoutProfile,
    TResult? Function(UserEntity user)? authenticatedWithProfile,
    TResult? Function(UserEntity user)? progress,
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
  }) {
    return authenticatedWithProfile?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? authenticatedWithoutProfile,
    TResult Function(UserEntity user)? authenticatedWithProfile,
    TResult Function(UserEntity user)? progress,
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticatedWithProfile != null) {
      return authenticatedWithProfile(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorAuthenticationState value) error,
    required TResult Function(_AuthenticatedWithoutProfileState value)
        authenticatedWithoutProfile,
    required TResult Function(_AuthenticatedState value)
        authenticatedWithProfile,
    required TResult Function(_AuthenticationInProgressState value) progress,
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
  }) {
    return authenticatedWithProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorAuthenticationState value)? error,
    TResult? Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult? Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult? Function(_AuthenticationInProgressState value)? progress,
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
  }) {
    return authenticatedWithProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorAuthenticationState value)? error,
    TResult Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult Function(_AuthenticationInProgressState value)? progress,
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (authenticatedWithProfile != null) {
      return authenticatedWithProfile(this);
    }
    return orElse();
  }
}

abstract class _AuthenticatedState extends AuthenticationState {
  factory _AuthenticatedState({required final UserEntity user}) =
      _$_AuthenticatedState;
  _AuthenticatedState._() : super._();

  @override
  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_AuthenticatedStateCopyWith<_$_AuthenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthenticationInProgressStateCopyWith<$Res> {
  factory _$$_AuthenticationInProgressStateCopyWith(
          _$_AuthenticationInProgressState value,
          $Res Function(_$_AuthenticationInProgressState) then) =
      __$$_AuthenticationInProgressStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class __$$_AuthenticationInProgressStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res,
        _$_AuthenticationInProgressState>
    implements _$$_AuthenticationInProgressStateCopyWith<$Res> {
  __$$_AuthenticationInProgressStateCopyWithImpl(
      _$_AuthenticationInProgressState _value,
      $Res Function(_$_AuthenticationInProgressState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_AuthenticationInProgressState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class _$_AuthenticationInProgressState extends _AuthenticationInProgressState {
  const _$_AuthenticationInProgressState({required this.user}) : super._();

  @override
  final UserEntity user;

  @override
  String toString() {
    return 'AuthenticationState.progress(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationInProgressState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationInProgressStateCopyWith<_$_AuthenticationInProgressState>
      get copyWith => __$$_AuthenticationInProgressStateCopyWithImpl<
          _$_AuthenticationInProgressState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) authenticatedWithoutProfile,
    required TResult Function(UserEntity user) authenticatedWithProfile,
    required TResult Function(UserEntity user) progress,
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
  }) {
    return progress(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? authenticatedWithoutProfile,
    TResult? Function(UserEntity user)? authenticatedWithProfile,
    TResult? Function(UserEntity user)? progress,
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
  }) {
    return progress?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? authenticatedWithoutProfile,
    TResult Function(UserEntity user)? authenticatedWithProfile,
    TResult Function(UserEntity user)? progress,
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorAuthenticationState value) error,
    required TResult Function(_AuthenticatedWithoutProfileState value)
        authenticatedWithoutProfile,
    required TResult Function(_AuthenticatedState value)
        authenticatedWithProfile,
    required TResult Function(_AuthenticationInProgressState value) progress,
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorAuthenticationState value)? error,
    TResult? Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult? Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult? Function(_AuthenticationInProgressState value)? progress,
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorAuthenticationState value)? error,
    TResult Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult Function(_AuthenticationInProgressState value)? progress,
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class _AuthenticationInProgressState extends AuthenticationState {
  const factory _AuthenticationInProgressState(
      {required final UserEntity user}) = _$_AuthenticationInProgressState;
  const _AuthenticationInProgressState._() : super._();

  @override
  UserEntity get user;
  @JsonKey(ignore: true)
  _$$_AuthenticationInProgressStateCopyWith<_$_AuthenticationInProgressState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NotAuthenticatedStateCopyWith<$Res> {
  factory _$$_NotAuthenticatedStateCopyWith(_$_NotAuthenticatedState value,
          $Res Function(_$_NotAuthenticatedState) then) =
      __$$_NotAuthenticatedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({NotAuthenticatedUser user});
}

/// @nodoc
class __$$_NotAuthenticatedStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_NotAuthenticatedState>
    implements _$$_NotAuthenticatedStateCopyWith<$Res> {
  __$$_NotAuthenticatedStateCopyWithImpl(_$_NotAuthenticatedState _value,
      $Res Function(_$_NotAuthenticatedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_NotAuthenticatedState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as NotAuthenticatedUser,
    ));
  }
}

/// @nodoc

@literal
class _$_NotAuthenticatedState extends _NotAuthenticatedState {
  const _$_NotAuthenticatedState({this.user = const NotAuthenticatedUser()})
      : super._();

  @override
  @JsonKey()
  final NotAuthenticatedUser user;

  @override
  String toString() {
    return 'AuthenticationState.notAuthenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotAuthenticatedState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotAuthenticatedStateCopyWith<_$_NotAuthenticatedState> get copyWith =>
      __$$_NotAuthenticatedStateCopyWithImpl<_$_NotAuthenticatedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(UserEntity user) authenticatedWithoutProfile,
    required TResult Function(UserEntity user) authenticatedWithProfile,
    required TResult Function(UserEntity user) progress,
    required TResult Function(NotAuthenticatedUser user) notAuthenticated,
  }) {
    return notAuthenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UserEntity user, String message)? error,
    TResult? Function(UserEntity user)? authenticatedWithoutProfile,
    TResult? Function(UserEntity user)? authenticatedWithProfile,
    TResult? Function(UserEntity user)? progress,
    TResult? Function(NotAuthenticatedUser user)? notAuthenticated,
  }) {
    return notAuthenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, String message)? error,
    TResult Function(UserEntity user)? authenticatedWithoutProfile,
    TResult Function(UserEntity user)? authenticatedWithProfile,
    TResult Function(UserEntity user)? progress,
    TResult Function(NotAuthenticatedUser user)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorAuthenticationState value) error,
    required TResult Function(_AuthenticatedWithoutProfileState value)
        authenticatedWithoutProfile,
    required TResult Function(_AuthenticatedState value)
        authenticatedWithProfile,
    required TResult Function(_AuthenticationInProgressState value) progress,
    required TResult Function(_NotAuthenticatedState value) notAuthenticated,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorAuthenticationState value)? error,
    TResult? Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult? Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult? Function(_AuthenticationInProgressState value)? progress,
    TResult? Function(_NotAuthenticatedState value)? notAuthenticated,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorAuthenticationState value)? error,
    TResult Function(_AuthenticatedWithoutProfileState value)?
        authenticatedWithoutProfile,
    TResult Function(_AuthenticatedState value)? authenticatedWithProfile,
    TResult Function(_AuthenticationInProgressState value)? progress,
    TResult Function(_NotAuthenticatedState value)? notAuthenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _NotAuthenticatedState extends AuthenticationState {
  const factory _NotAuthenticatedState({final NotAuthenticatedUser user}) =
      _$_NotAuthenticatedState;
  const _NotAuthenticatedState._() : super._();

  @override
  NotAuthenticatedUser get user;
  @JsonKey(ignore: true)
  _$$_NotAuthenticatedStateCopyWith<_$_NotAuthenticatedState> get copyWith =>
      throw _privateConstructorUsedError;
}
