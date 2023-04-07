import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';
import 'package:textly/src/feature/home/widget/default_home_screen_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultHomeScreen(
      title: 'Settings page',
      location: '/settings',
      child: Column(
        children: [
          if (AuthenticationScope.isAuthenticatedOf(context))
            ElevatedButton(
              onPressed: () {
                AuthenticationScope.logOut(context);
                context.go('/global');
              },
              child: const Text('Exit from account'),
            )
        ],
      ),
    );
  }
}
