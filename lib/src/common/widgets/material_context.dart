import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:textly/src/common/l10n/l10n.dart';
import 'package:textly/src/common/router/router.dart';
import 'package:textly/src/common/widgets/repostiory_scope.dart';
import 'package:textly/src/feature/auth/bloc/auth_bloc.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';
import 'package:textly/src/feature/theme/dart_theme.dart';
import 'package:textly/src/feature/theme/light_theme.dart';
import 'package:textly_ui/textly_ui.dart';

@immutable
class AppMaterialContext extends StatefulWidget {
  const AppMaterialContext({
    super.key,
  });

  @override
  State<AppMaterialContext> createState() => _AppMaterialContextState();
}

class _AppMaterialContextState extends State<AppMaterialContext> {
  late MainRouter mainRouter;
  @override
  void initState() {
    mainRouter = MainRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: dartTheme,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ru'), // Russian
      ],
      routerConfig: mainRouter.goRouter,
      debugShowCheckedModeBanner: false,
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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TextlyScaffold(
      appBar: TextlyAppBar(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      navigationRail: SideNavigationMenu(
        currentIndex: currentIndex,
        items: [
          NavigationMenuItem(
            lable: 'Главная',
            icon: const Text(
              '👋',
              style: TextStyle(fontFamilyFallback: ['Noto Color Emoji']),
            ),
          ),
          NavigationMenuItem(lable: 'Не главная', icon: const Text('🎲')),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
      rightSide: Column(
        children: const [
          Placeholder(
            fallbackHeight: 200,
          )
        ],
      ),
      isRootScreen: true,
      body: BlocBuilder<AuthenticationBLoC, AuthenticationState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Hello'),
              Text('Name from locale  ${context.l10n.nameApp}'),
              Text(
                'Current version/AppMetadata from RepoScope  ${context.repoStorage.appMetadata.appVersion}',
              ),
              Text('Current user: ${state.user}'),
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
              if (AuthenticationScope.authenticatedOrNullOf(
                    context,
                    listen: true,
                  )?.withProfile ==
                  false)
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const TestCreateProfileScreen(),
                      ),
                    );
                  },
                  child: const Text('Create Profile'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestCreateProfileScreen extends StatefulWidget {
  const TestCreateProfileScreen({super.key});

  @override
  State<TestCreateProfileScreen> createState() =>
      _TestCreateProfileScreenState();
}

class _TestCreateProfileScreenState extends State<TestCreateProfileScreen> {
  final usernameContoller = TextEditingController();
  final avatarContoller = TextEditingController();
  Color color = Colors.pink;
  final profileNameContoller = TextEditingController();
  final descriptionContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBLoC, AuthenticationState>(
      listener: (context, state) =>
          state.withProfile ? Navigator.of(context).pop() : null,
      child: Scaffold(
        body: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: TextFormField(
                controller: avatarContoller,
              ),
            ),
            TextButton(
              onPressed: () {
                color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(1);
                setState(() {});
              },
              child: const Text('Random'),
            ),
            TextFormField(
              controller: usernameContoller,
              decoration: const InputDecoration(label: Text('Username')),
            ),
            TextFormField(
              controller: profileNameContoller,
              decoration: const InputDecoration(label: Text('Profile name')),
            ),
            TextFormField(
              controller: descriptionContoller,
              decoration: const InputDecoration(label: Text('Description')),
            ),
            ElevatedButton(
              onPressed: () {
                AuthenticationScope.createProfile(
                  context,
                  usernameContoller.text,
                  avatarContoller.text,
                  color.value.toRadixString(16).padLeft(8, '0'),
                  profileNameContoller.text,
                  descriptionContoller.text,
                );
              },
              child: const Text('Create Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
