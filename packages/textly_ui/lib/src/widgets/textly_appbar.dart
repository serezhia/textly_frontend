// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:textly_ui/src/theme/textly_appbar_theme.dart';

class TextlyAppBar {
  TextlyAppBar({
    this.theme,
    this.centerAppBar,
    this.leftSideLeading,
    this.rightSideLeading,
    this.heightAppBar,
  });

  final AppBar? centerAppBar;
  final Widget? leftSideLeading;
  final Widget? rightSideLeading;

  final TextlyAppbarTheme? theme;
  final double? heightAppBar;
}
