import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:textly/src/common/l10n/l10n.dart';
import 'package:textly/src/common/widgets/repostiory_scope.dart';

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

class TestWidget extends StatelessWidget {
  const TestWidget({
    super.key,
  });

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
          ],
        ),
      ),
    );
  }
}
