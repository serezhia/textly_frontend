// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

@immutable
class TextlyScafoldTheme extends ThemeExtension<TextlyScafoldTheme> {
  const TextlyScafoldTheme({
    required this.backgroundColor,
  });

  final Color? backgroundColor;

  @override
  TextlyScafoldTheme copyWith({
    Color? backgroundColor,
  }) {
    return TextlyScafoldTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }

  @override
  TextlyScafoldTheme lerp(TextlyScafoldTheme? other, double t) {
    if (other is! TextlyScafoldTheme) {
      return this;
    }
    return TextlyScafoldTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }

  @override
  String toString() => 'TextlyScaffold(backgroundColor: $backgroundColor)';
}
