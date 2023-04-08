import 'package:flutter/material.dart';
import 'package:textly_ui/textly_ui.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TextlyScaffold(
      appBar: TextlyAppBar(
        title: const Text('Feed'),
      ),
      body: const Placeholder(
        child: Text('Feed_page'),
      ),
    );
  }
}
