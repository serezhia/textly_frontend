import 'package:fresh/fresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textly/src/feature/auth/data/user_data_provider.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';
import 'package:textly_core/textly_core.dart';

class SharedPrefsTokenStorage implements TokenStorage<OAuth2Token> {
  SharedPrefsTokenStorage(this.userDataProvider);

  final IUserDataProvider userDataProvider;
  @override
  Future<void> delete() async {
    await userDataProvider.deleteFromStorage();
  }

  @override
  Future<OAuth2Token> read() async {
    return (await userDataProvider.getFromStorage()).tokens ??
        const OAuth2Token(accessToken: 'error');
  }

  @override
  Future<void> write(OAuth2Token token) async {
    final user = await userDataProvider.getFromStorage();

    await userDataProvider.updateInStorage(
      UserEntity.authenticated(
        userId: user.userId!,
        email: user.email!,
        tokens: token,
        withProfile: user.withProfile,
      ),
    );
  }
}
