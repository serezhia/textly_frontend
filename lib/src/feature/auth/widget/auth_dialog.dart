import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:textly/src/common/consts/emoji_and_colors.dart';
import 'package:textly/src/common/utils/colors_emoji_util.dart';
import 'package:textly/src/feature/auth/bloc/auth_bloc.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';
import 'package:textly_ui/textly_ui.dart';

class AuthDialog extends StatefulWidget {
  const AuthDialog({super.key});

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('test title')),
      shadowColor: Colors.transparent,
      elevation: 0,
      scrollable: true,
      contentPadding: const EdgeInsets.all(16),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: BlocConsumer<AuthenticationBLoC, AuthenticationState>(
        listener: (context, state) {
          if (state.withProfile) {
            Navigator.of(context).pop();
          }
        },
        builder: (conetxt, state) => state.map(
          error: (state) => const _LoadingAuthDialog(),
          authenticatedWithoutProfile: (state) =>
              const _CreateAccountAuthDialog(),
          authenticatedWithProfile: (state) =>
              const _AlreadyAuthenticatedAuthDialog(),
          progress: (state) => const _LoadingAuthDialog(),
          notAuthenticated: (state) => const _NotAuthenticatedAuthDialog(),
          notAuthenticatedWithCode: (state) => const _VerifyCodeAuthDialog(),
        ),
      ),
    );
  }
}

class _LoadingAuthDialog extends StatelessWidget {
  const _LoadingAuthDialog();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _NotAuthenticatedAuthDialog extends StatelessWidget {
  const _NotAuthenticatedAuthDialog();

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final emailController = TextEditingController();
    return Form(
      key: key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              Text(
                'Войдите,\nчтобы быть в курсе\nсобытий',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'TT Norm Pro',
                ),
              ),
              SizedBox(width: 20),
              Text(
                '👻',
                style: TextStyle(
                  fontSize: 40,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
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
          const SizedBox(height: 10),
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
    );
  }
}

class _VerifyCodeAuthDialog extends StatelessWidget {
  const _VerifyCodeAuthDialog();

  @override
  Widget build(BuildContext context) {
    final pinCotroller = TextEditingController();
    return Column(
      children: [
        const Text('Введите код подверждения'),
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
    );
  }
}

class _AlreadyAuthenticatedAuthDialog extends StatelessWidget {
  const _AlreadyAuthenticatedAuthDialog();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('Вы уже авторизованы'),
      ],
    );
  }
}

class _CreateAccountAuthDialog extends StatefulWidget {
  const _CreateAccountAuthDialog();

  @override
  State<_CreateAccountAuthDialog> createState() =>
      _CreateAccountAuthDialogState();
}

class _CreateAccountAuthDialogState extends State<_CreateAccountAuthDialog> {
  final usernameController = TextEditingController();
  final profileNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final avatarController = TextEditingController();
  late Color backgroundColor;
  @override
  void initState() {
    backgroundColor = generateRandomColor();
    avatarController.text = generateRandomEmoji();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Emoji'),
                TextButton(
                  onPressed: () {
                    avatarController.text = generateRandomEmoji();
                    setState(() {});
                  },
                  child: const Text('🎲'),
                )
              ],
            ),
            Container(
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
              ),
              padding: const EdgeInsets.all(16),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  avatarController.text,
                  maxLines: 1,
                ),
              ),
            ),
            Column(
              children: [
                const Text('Color'),
                TextButton(
                  onPressed: () {
                    backgroundColor = generateRandomColor();

                    setState(() {});
                  },
                  child: const Text('🎲'),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        TextlyTextField(
          textEditingController: usernameController,
          textFieldText: 'Username',
        ),
        const SizedBox(height: 10),
        TextlyTextField(
          textEditingController: profileNameController,
          textFieldText: 'Profile name',
        ),
        const SizedBox(height: 10),
        TextlyTextField(
          textEditingController: descriptionController,
          textFieldText: 'Description',
          maxlines: 5,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            AuthenticationScope.createProfile(
              context,
              usernameController.text,
              avatarController.text,
              backgroundColor.value.toRadixString(16).substring(2),
              profileNameController.text,
              descriptionController.text,
            );
          },
          child: const Text('Создать'),
        )
      ],
    );
  }
}
