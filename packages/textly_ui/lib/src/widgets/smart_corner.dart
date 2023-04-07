// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:textly_ui/textly_ui.dart';

class SmartCorner extends StatelessWidget {
  const SmartCorner({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil.screenSize().representation == 'xsmall' ? 0 : 16,
        ),
      ),
      child: KeyedSubtree(key: key, child: child),
    );
  }
}
