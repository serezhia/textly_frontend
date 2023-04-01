import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:textly/src/common/l10n/l10n.dart';
import 'package:textly/src/common/widgets/repostiory_scope.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';

@immutable
class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({
    super.key,
  });

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ru'), // Russian
      ],
      home: TestWidget(),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({
    super.key,
  });

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final codeController = TextEditingController();
  final emailController = TextEditingController();

  bool codeSented = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello'),
            Text('Name from locale  ${context.l10n.nameApp}'),
            Text(
              'Current version/AppMetadata from RepoScope  ${context.repoStorage.appMetadata.appVersion}',
            ),
            Text('Current user: ${AuthenticationScope.userOf(
              context,
              listen: true,
            )}'),
            if (AuthenticationScope.authenticatedOrNullOf(
                  context,
                  listen: true,
                ) ==
                null)
              TextFormField(
                decoration: const InputDecoration(label: Text('Email')),
                controller: emailController,
              ),
            if (AuthenticationScope.authenticatedOrNullOf(
                  context,
                  listen: true,
                ) ==
                null)
              ElevatedButton(
                onPressed: () {
                  codeSented = true;
                  AuthenticationScope.sendCodeToEmail(
                    context,
                    emailController.text,
                  );
                  setState(() {});
                },
                child: const Text('Send code'),
              ),
            if (codeSented &&
                AuthenticationScope.authenticatedOrNullOf(
                      context,
                      listen: true,
                    ) ==
                    null)
              TextFormField(
                decoration: const InputDecoration(label: Text('Code')),
                controller: codeController,
              ),
            if (codeSented &&
                AuthenticationScope.authenticatedOrNullOf(
                      context,
                      listen: true,
                    ) ==
                    null)
              ElevatedButton(
                onPressed: () {
                  AuthenticationScope.signInWithEmail(
                    context,
                    emailController.text,
                    codeController.text,
                  );
                },
                child: const Text('Login'),
              ),
            if (AuthenticationScope.authenticatedOrNullOf(
                  context,
                  listen: true,
                ) !=
                null)
              ElevatedButton(
                onPressed: () {
                  AuthenticationScope.logOut(
                    context,
                  );
                },
                child: const Text('Logout'),
              ),
          ],
        ),
      ),
    );
  }
}
