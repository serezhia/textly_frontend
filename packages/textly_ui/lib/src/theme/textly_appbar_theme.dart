// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

@immutable
class TextlyAppbarTheme extends ThemeExtension<TextlyAppbarTheme> {
  const TextlyAppbarTheme({
    required this.backgroundColor,
  });

  final Color? backgroundColor;

  @override
  TextlyAppbarTheme copyWith({
    Color? backgroundColor,
  }) {
    return TextlyAppbarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
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
  String toString() => 'MyColors(backgroundColor: $backgroundColor)';
}
