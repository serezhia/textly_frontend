// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    super.key,
    required this.condition,
    required this.trueParent,
    required this.falseParent,
    required this.child,
  });

  final bool condition;
  final TransitionBuilder trueParent;
  final TransitionBuilder falseParent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    return condition
        ? trueParent(context, KeyedSubtree(key: key, child: child))
        : falseParent(context, KeyedSubtree(key: key, child: child));
  }
}
