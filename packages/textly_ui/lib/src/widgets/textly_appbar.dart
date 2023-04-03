// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class TextlyAppBar {
  TextlyAppBar({
    required this.appBar,
  });

  final AppBar appBar;
  Color get colorAppBar => appBar.backgroundColor ?? Colors.black;
  double get heightAppBar => appBar.preferredSize.height;
}
