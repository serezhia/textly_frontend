// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fresh/fresh.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:l/l.dart';
import 'package:textly/src/common/consts/config_app.dart';
import 'package:textly/src/common/fresh/data/shared_pref_token_storage.dart';
import 'package:textly/src/feature/auth/data/user_data_provider.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';
import 'package:textly_core/textly_core.dart';

abstract class IAuthRepository {
  UserEntity get firstFetchUser;

  /// Разлогиниться
  Future<void> logOut();

  /// Залогиниться через почту
  Future<UserEntity> sendEmailCode({
    required String email,
  });

  /// Залогиниться через почту
  Future<UserEntity> signInWithEmail({
    required String email,
    required String code,
  });

  Future<bool> isProfileExists({required int userId});

  /// Создать профиль
  Future<UserEntity> createProfile({required Profile profile});

  Future<UserEntity> userFromStorage();
}

class ApiAuthRepository implements IAuthRepository {
  ApiAuthRepository({
    required this.firstFetchUser,
    required this.dio,
    required this.userDataProvider,
  });
  @override
  final UserEntity firstFetchUser;

  final Dio dio;
  final IUserDataProvider userDataProvider;

  /// Разлогиниться
  @override
  Future<void> logOut() async {
    dio.interceptors.clear();
    await userDataProvider.deleteFromStorage();
  }

  /// Залогиниться через почту
  @override
  Future<UserEntity> sendEmailCode({
    required String email,
  }) async {
    try {
      l.vvvvvv('Отправка запроса на получение кода ');

      await dio.post<dynamic>(
        '$apiDomen/auth/code',
        data: jsonEncode(
          {
            'mail': email,
            'region': 'ru',
          },
        ),
      );

      l.vvvvvv('Код уcпешно отправлен');
      final newUser = UserEntity.notAuthenticated(email: email);
      await userDataProvider.updateInStorage(newUser);
      return newUser;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> createProfile({required Profile profile}) async {
    final response = await dio.post<Map<String, Object?>>(
      '$apiDomen/profiles/profile',
      data: jsonEncode(
        {
          'username': profile.username,
          'profile_name': profile.profileName,
          'avatar': profile.avatar,
          'background_color': profile.backgroundColor,
          'description': profile.description,
        },
      ),
    );
    if (response.data?['status'] == 'Success') {
      final user = await userDataProvider.getFromStorage();
      final newUser = UserEntity.authenticated(
        userId: user.userId!,
        email: user.email!,
        tokens: user.tokens!,
        withProfile: true,
      );
      await userDataProvider.updateInStorage(newUser);
      return newUser;
    } else {
      throw Exception(response.data?['message']);
    }
  }

  @override
  Future<bool> isProfileExists({required int userId}) async {
    try {
      final response = await dio.get<Map<String, Object?>>(
        '$apiDomen/profiles/profile/$userId',
      );
      if (response.data == null || response.data?['status'] == null) {
        return false;
      }

      if (response.data!['status'] as String == 'Success') {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<UserEntity> signInWithEmail({
    required String email,
    required String code,
  }) async {
    try {
      l.vvvvvv('Отправка кода и почты для сверки');

      final response = await dio.post<Map<String, Object?>>(
        '$apiDomen/auth/signin',
        data: jsonEncode(
          {
            'mail': email,
            'code': code,
          },
        ),
      );

      l.vvvvvv('Успешный вход');

      final tokens =
          OAuth2Token.fromJson(response.data!['data'] as Map<String, Object?>);

      final accessTokenData = JwtDecoder.decode(tokens.accessToken);
      final userId = int.parse(accessTokenData['sub'] as String);

      l.vvvvvv('Проверка наличия профиля');

      final withProfile = await isProfileExists(userId: userId);

      l.vvvvvv('WithProfile: $withProfile');

      final user = AuthenticatedUser(
        userId: userId,
        email: email,
        tokens: tokens,
        withProfile: withProfile,
      );

      await userDataProvider.updateInStorage(user);
      l.vvvvvv('Добавление интерцептора для входа');
      dio.interceptors.add(
        Fresh.oAuth2(
          tokenStorage: SharedPrefsTokenStorage(userDataProvider),
          refreshToken: (token, client) async {
            final response = await client.post<Map<String, Object?>>(
              '$apiDomen/auth/refresh',
              options: Options(
                headers: {
                  'Authorization': 'Bearer ${token!.refreshToken}',
                },
              ),
            );
            return OAuth2Token.fromJson(
              response.data!['data'] as Map<String, Object?>,
            );
          },
        ),
      );
      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> userFromStorage() => userDataProvider.getFromStorage();
}
