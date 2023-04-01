// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:l/l.dart';
import 'package:textly/src/common/consts/config_app.dart';
import 'package:textly/src/feature/auth/data/user_data_provider.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';
import 'package:textly_core/textly_core.dart';

abstract class IAuthRepository {
  UserEntity get firstFetchUser;

  /// Разлогиниться
  Future<void> logOut();

  /// Залогиниться через почту
  Future<void> sendEmailCode({
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
    await userDataProvider.deleteFromStorage();
  }

  /// Залогиниться через почту
  @override
  Future<void> sendEmailCode({
    required String email,
  }) async {
    try {
      l.vvvvvv('Отправка запроса на получение кода ');

      await dio.post<dynamic>(
        '$apiDomen/auth/code',
        data: {
          'mail': email,
          'region': 'ru',
        },
      );

      l.vvvvvv('Код уcпешно отправлен');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> createProfile({required Profile profile}) {
    // TODO: implement createProfile
    throw UnimplementedError();
  }

  @override
  Future<bool> isProfileExists({required int userId}) async {
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
        data: {
          'mail': email,
          'code': code,
        },
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

      return user;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> userFromStorage() => userDataProvider.getFromStorage();
}
