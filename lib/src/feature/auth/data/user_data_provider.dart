// ignore_for_file: cast_nullable_to_non_nullable

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';
import 'package:textly_core/textly_core.dart';

abstract class IUserDataProvider {
  Future<UserEntity> getFromStorage();
  Future<UserEntity> updateInStorage(UserEntity user);
  Future<void> deleteFromStorage();
}

class SharedPrefsUserDataProvider implements IUserDataProvider {
  SharedPrefsUserDataProvider(this.storage);

  final SharedPreferences storage;

  @override
  Future<void> deleteFromStorage() async {
    await storage.remove('user_entity');
  }

  @override
  Future<UserEntity> getFromStorage() async {
    final json = jsonDecode(
      storage.getString('user_entity') ?? '{"email": null}',
    ) as Map<String, Object?>;

    if (json['email'] == null) {
      return const NotAuthenticatedUser();
    } else {
      return AuthenticatedUser(
        userId: json['user_id'] as int,
        email: json['email'] as String,
        tokens: OAuth2Token.fromJson(json['tokens'] as Map<String, Object?>),
        withProfile: json['with_profile'] == true,
      );
    }
  }

  @override
  Future<UserEntity> updateInStorage(UserEntity user) async {
    await user.when(
      authenticated: (user) async {
        await storage.remove('user_entity');
        await storage.setString(
          'user_entity',
          jsonEncode({
            'user_id': user.userId,
            'email': user.email,
            'tokens': user.tokens,
            'with_profile': user.withProfile,
          }),
        );
      },
      notAuthenticated: () async {
        await storage.remove('user_entity');
      },
    );
    return user;
  }
}
