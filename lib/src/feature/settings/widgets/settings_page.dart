import 'package:flutter/material.dart';
import 'package:textly/src/feature/home/widget/default_home_screen_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultHomeScreen(
      title: 'Settings page',
      location: '/settings',
      child: Placeholder(
        child: Text('Settings page'),
      ),
    );
  }
}
