import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).extension<LogoWidgetTheme>();
    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth >= 200
          ? Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  'Textly',
                  style: TextStyle(
                    color: style?.logoColor,
                    fontSize: 35,
                    fontFamily: 'TT Norms Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          : Align(
              child: Text(
                'Te',
                style: TextStyle(
                  color: style?.logoColor,
                  fontSize: 35,
                  fontFamily: 'TT Norms Pro',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
    );
  }
}

@immutable
class LogoWidgetTheme extends ThemeExtension<LogoWidgetTheme> {
  const LogoWidgetTheme({
    required this.logoColor,
  });

  final Color? logoColor;

  @override
  LogoWidgetTheme copyWith({
    Color? logoColor,
  }) {
    return LogoWidgetTheme(
      logoColor: logoColor ?? this.logoColor,
    );
  }

  @override
  LogoWidgetTheme lerp(LogoWidgetTheme? other, double t) {
    if (other is! LogoWidgetTheme) {
      return this;
    }
    return LogoWidgetTheme(
      logoColor: Color.lerp(logoColor, other.logoColor, t),
    );
  }

  @override
  String toString() => 'LogoWidget(logoColor: $logoColor)';
}
