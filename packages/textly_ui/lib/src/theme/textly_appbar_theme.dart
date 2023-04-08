// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

@immutable
class TextlyAppbarTheme extends ThemeExtension<TextlyAppbarTheme> {
  const TextlyAppbarTheme({
    this.titleTextStyle,
    this.backgroundColor = Colors.white,
    this.toolbarHeight,
  });

  final Color? backgroundColor;
  final double? toolbarHeight;
  final TextStyle? titleTextStyle;

  @override
  TextlyAppbarTheme copyWith({
    Color? backgroundColor,
    double? toolbarHeight,
    TextStyle? titleTextStyle,
  }) {
    return TextlyAppbarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      toolbarHeight: toolbarHeight ?? this.toolbarHeight,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
    );
  }

  @override
  TextlyAppbarTheme lerp(TextlyAppbarTheme? other, double t) {
    if (other is! TextlyAppbarTheme) {
      return this;
    }

    return TextlyAppbarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }

  @override
  String toString() =>
      '''TextlyAppBarTheme(backgroundColor: $backgroundColor, TextStyle: $titleTextStyle,toolbarHeight: $toolbarHeight )''';
}
