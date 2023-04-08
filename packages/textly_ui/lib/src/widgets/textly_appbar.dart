// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:textly_ui/src/theme/textly_appbar_theme.dart';

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight)
      : super.fromHeight(toolbarHeight ?? kToolbarHeight);

  final double? toolbarHeight;
}

class TextlyAppBar extends StatefulWidget implements PreferredSizeWidget {
  TextlyAppBar({
    super.key,
    this.leftSideLeading,
    this.rightSideLeading,
    this.theme,
    this.toolbarHeight,
    this.title,
    this.leading,
    this.actions,
    this.buildCenter = true,
  }) : preferredSize = _PreferredAppBarSize(toolbarHeight);

  final AppBarSideLeading? leftSideLeading;
  final AppBarSideLeading? rightSideLeading;
  final Widget? title;
  final Widget? leading;
  final TextlyAppbarTheme? theme;
  final double? toolbarHeight;
  final List<Widget>? actions;
  final bool buildCenter;

  @override
  final Size preferredSize;

  static double preferredHeightFor(BuildContext context, Size preferredSize) {
    if (preferredSize is _PreferredAppBarSize &&
        preferredSize.toolbarHeight == null) {
      return Theme.of(context).extension<TextlyAppbarTheme>()?.toolbarHeight ??
          kToolbarHeight;
    }
    return preferredSize.height;
  }

  @override
  State<TextlyAppBar> createState() => _TextlyAppBarState();
}

class _TextlyAppBarState extends State<TextlyAppBar> {
  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).extension<TextlyAppbarTheme>();

    final leading = widget.leading;

    Widget? actions;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions!,
      );
    }

    return Container(
      color: appBarTheme?.backgroundColor,
      height:
          widget.preferredSize.height + MediaQuery.of(context).viewPadding.top,
      child:

          // ClipRRect(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(
          //         sigmaX: 20, sigmaY: 20, tileMode: TileMode.decal),
          // child:
          SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (leading != null) leading,
            // Отступ перед заголовком
            const SizedBox(
              width: 16,
            ),
            if (widget.title != null)
              Expanded(
                child: DefaultTextStyle(
                  style: appBarTheme?.titleTextStyle ??
                      const TextStyle(
                        fontSize: 30,
                        fontFamily: 'TT Norms Pro',
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: widget.title,
                  ),
                ),
              ),
            if (actions != null) actions,
          ],
        ),
      ),
      //   ),
      // ),
    );
  }
}

class _PreferredAppBarLeadingSize extends Size {
  _PreferredAppBarLeadingSize(this.toolbarHeight)
      : super.fromHeight(toolbarHeight ?? kToolbarHeight);

  final double? toolbarHeight;
}

class AppBarSideLeading extends StatelessWidget implements PreferredSizeWidget {
  AppBarSideLeading({
    super.key,
    required this.child,
    this.toolbarHeight,
  }) : preferredSize = _PreferredAppBarLeadingSize(toolbarHeight);

  final Widget child;

  final double? toolbarHeight;

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: preferredSize.height,
      color:
          Theme.of(context).extension<TextlyAppbarTheme>()?.backgroundColor ??
              Colors.white,
      child: child,
    );
  }
}
