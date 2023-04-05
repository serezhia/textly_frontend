import 'package:flutter/material.dart';

import 'package:textly_ui/textly_ui.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextlyScaffold(
      body: Placeholder(
        child: Text('Notification page'),
      ),
    );
  }
}
