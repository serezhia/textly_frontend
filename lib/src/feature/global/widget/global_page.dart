import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:textly_ui/textly_ui.dart';

class GlobalPage extends StatefulWidget {
  const GlobalPage({super.key});

  @override
  State<GlobalPage> createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  @override
  Widget build(BuildContext context) {
    return TextlyScaffold(
      theme: Theme.of(context).extension<TextlyScafoldTheme>(),
      appBar: TextlyAppBar(
        title: const Text('Global'),
        theme: Theme.of(context).extension<TextlyAppbarTheme>(),
      ),
      body: ListView.separated(
        itemCount: 1000,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => index == 0
            ? const SizedBox(height: 0)
            : GestureDetector(
                onTap: () => context.push('/profiles/$index'),
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Center(child: Text(index.toString())),
                ),
              ),
      ),
    );
  }
}
