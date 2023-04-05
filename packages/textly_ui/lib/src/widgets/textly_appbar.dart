// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class TextlyAppBar {
  TextlyAppBar({
    required this.appBar,
    this.leftSideLeading,
    this.rightSideLeading,
  });

  final AppBar appBar;
  final Widget? leftSideLeading;
  final Widget? rightSideLeading;
  Color get colorAppBar => appBar.backgroundColor ?? Colors.black;
  double get heightAppBar => appBar.preferredSize.height;
}
