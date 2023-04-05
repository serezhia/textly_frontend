import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:textly/src/feature/auth/bloc/auth_bloc.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';
import 'package:textly/src/feature/lego/widgets/lego_widget.dart';
import 'package:textly_ui/textly_ui.dart';

class AuthLegoWidget extends StatelessWidget {
  const AuthLegoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBLoC, AuthenticationState>(
      builder: (context, state) {
        return state.map(
          error: (state) => _ErrorAuthLego(error: state.message),
          authenticatedWithoutProfile: (state) => Container(),
          authenticatedWithProfile: (state) => Container(),
          progress: (state) => const _LoadingAuthLego(),
          notAuthenticatedWithCode: (state) => const _NotAuthWithCodeAuthLego(),
          notAuthenticated: (state) => const _NotAuthLego(),
        );
      },
    );
  }
}

class _ErrorAuthLego extends StatelessWidget {
  const _ErrorAuthLego({
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Text(error);
  }
}

class _LoadingAuthLego extends StatelessWidget {
  const _LoadingAuthLego();
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _NotAuthLego extends StatelessWidget {
  const _NotAuthLego();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final emailController = TextEditingController();
    return LegoWidget(
      title: const Text('Войдите,\nчтобы быть в курсе событий'),
      titleIcon: const Text('👋'),
      child: Form(
        key: key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextlyTextField(
              textEditingController: emailController,
              textFieldText: 'Email',
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return 'This field is required';
                }
                if (EmailValidator.validate(email)) {
                  return null;
                } else {
                  return 'Enter a valid email address';
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (key.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Correct'),
                    ),
                  );
                  AuthenticationScope.sendCodeToEmail(
                    context,
                    emailController.text,
                  );
                }
              },
              child: const Text('Отправить код'),
            )
          ],
        ),
      ),
    );
  }
}

class _NotAuthWithCodeAuthLego extends StatelessWidget {
  const _NotAuthWithCodeAuthLego();

  @override
  Widget build(BuildContext context) {
    final pinCotroller = TextEditingController();
    return LegoWidget(
      title: const Text('Введите код подверждения'),
      titleIcon: const Text('🔑'),
      child: Column(
        children: [
          PinCodeTextField(
            controller: pinCotroller,
            appContext: context,
            length: 6,
            onChanged: (pin) {},
          ),
          ElevatedButton(
            onPressed: () {
              AuthenticationScope.signInWithEmail(
                context,
                context.read<AuthenticationBLoC>().state.user.email ??
                    'error email',
                pinCotroller.text,
              );
            },
            child: const Text('Войти'),
          )
        ],
      ),
    );
  }
}
