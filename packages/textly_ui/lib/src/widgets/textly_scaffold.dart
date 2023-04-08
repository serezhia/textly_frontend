// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:textly_ui/src/consts/consts.dart';

import 'package:textly_ui/textly_ui.dart';

class TextlyScaffold extends StatefulWidget {
  const TextlyScaffold({
    super.key,
    this.appBar,
    this.buttomNavigationMenu,
    this.sideNavigationMenu,
    this.rightSide,
    this.isRootScreen = false,
    required this.body,
    this.theme,
  });

  final bool isRootScreen;

  final TextlyScafoldTheme? theme;

  final TextlyAppBar? appBar;
  final Widget body;

  final ButtomNavigationMenu? buttomNavigationMenu;
  final SideNavigationMenu? sideNavigationMenu;
  final Widget? rightSide;

  @override
  State<TextlyScaffold> createState() => _TextlyScaffoldState();
}

class _TextlyScaffoldState extends State<TextlyScaffold> {
  final unKey = UniqueKey();
  final bodyKey = GlobalKey();
  final rightBarKey = GlobalKey();
  final scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //Default theme
    final theme = widget.theme ??
        const TextlyScafoldTheme(
          backgroundColor: Color(0xFFFAFAFA),
        );

    return Scaffold(
      backgroundColor: widget.theme?.backgroundColor,
      body: LayoutBuilder(
        builder: (context, contraints) {
          if (contraints.maxWidth >= ScreenSize.extraLarge.min) {
            return _XLargeScaffold(
              scaffoldKey: scaffoldKey,
              theme: theme,
              isRootScreen: widget.isRootScreen,
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              sideNavigationMenu: widget.sideNavigationMenu,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
            );
          } else if (contraints.maxWidth >= ScreenSize.large.min) {
            return _LargeScaffold(
              scaffoldKey: scaffoldKey,
              theme: theme,
              isRootScreen: widget.isRootScreen,
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              sideNavigationMenu: widget.sideNavigationMenu,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
            );
          } else if (contraints.maxWidth >= ScreenSize.medium.min) {
            return _MediumScaffold(
              scaffoldKey: scaffoldKey,
              theme: theme,
              isRootScreen: widget.isRootScreen,
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              sideNavigationMenu: widget.sideNavigationMenu,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
            );
          } else if (contraints.maxWidth >= ScreenSize.small.min) {
            return _SmallScaffold(
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              sideNavigationMenu: widget.sideNavigationMenu,
              isRootScreen: widget.isRootScreen,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
              scaffoldKey: scaffoldKey,
              theme: theme,
            );
          } else {
            return _XSmallScaffold(
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              buttomNavigationMenu: widget.buttomNavigationMenu,
              theme: theme,
              scaffoldKey: scaffoldKey,
            );
          }
        },
      ),
    );
  }
}

class _XLargeScaffold extends StatelessWidget {
  const _XLargeScaffold({
    required this.body,
    required this.bodyKey,
    this.sideNavigationMenu,
    this.rightSide,
    this.appBar,
    required this.rightBarKey,
    required this.isRootScreen,
    required this.theme,
    required this.scaffoldKey,
  });
  final GlobalKey bodyKey;
  final GlobalKey rightBarKey;
  final GlobalKey scaffoldKey;
  final TextlyAppBar? appBar;
  final Widget body;
  final SideNavigationMenu? sideNavigationMenu;
  final Widget? rightSide;
  final bool isRootScreen;
  final TextlyScafoldTheme theme;

  @override
  Widget build(BuildContext context) {
    final padding = SizedBox(
      width: 10,
      child: Column(
        children: [
          Container(
            height: appBar?.preferredSize.height ?? 0,
            color: appBar?.theme?.backgroundColor,
          ),
        ],
      ),
    );

    final expandedPadding = Expanded(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: appBar?.preferredSize.height ?? 0,
              color: appBar?.theme?.backgroundColor,
            ),
          ],
        ),
      ),
    );

    if (isRootScreen) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          expandedPadding,
          //Left side
          SizedBox(
            width: 200,
            child: Scaffold(
              appBar: appBar?.leftSideLeading,
              body: sideNavigationMenu,
            ),
          ),
          //Padding
          padding,
          SizedBox(
            width: 600,
            child: Scaffold(
              backgroundColor: theme.backgroundColor,
              key: scaffoldKey,
              appBar: appBar?.buildCenter ?? false ? appBar : null,
              body: KeyedSubtree(
                key: bodyKey,
                child: body,
              ),
            ),
          ),
          //Padding
          padding,
          //Right side
          SizedBox(
            width: 300,
            child: Scaffold(
              appBar: appBar?.rightSideLeading,
              body: rightSide == null
                  ? null
                  : KeyedSubtree(
                      key: rightBarKey,
                      child: rightSide!,
                    ),
            ),
          ),
          expandedPadding,
        ],
      );
    } else {
      return Scaffold(
        key: scaffoldKey,
        appBar: appBar?.buildCenter ?? false ? appBar : null,
        backgroundColor: theme.backgroundColor,
        body: KeyedSubtree(
          key: bodyKey,
          child: body,
        ),
      );
    }
  }
}

class _LargeScaffold extends StatelessWidget {
  const _LargeScaffold({
    required this.body,
    this.sideNavigationMenu,
    this.rightSide,
    this.appBar,
    required this.bodyKey,
    required this.rightBarKey,
    required this.isRootScreen,
    required this.theme,
    required this.scaffoldKey,
  });

  final TextlyAppBar? appBar;
  final Widget body;
  final SideNavigationMenu? sideNavigationMenu;
  final GlobalKey bodyKey;
  final Widget? rightSide;
  final GlobalKey rightBarKey;
  final GlobalKey scaffoldKey;

  final bool isRootScreen;
  final TextlyScafoldTheme theme;

  @override
  Widget build(BuildContext context) {
    final padding = SizedBox(
      width: 10,
      child: Column(
        children: [
          Container(
            height: appBar?.preferredSize.height ?? 0,
            color: appBar?.theme?.backgroundColor,
          ),
        ],
      ),
    );

    final expandedPadding = Expanded(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: appBar?.preferredSize.height ?? 0,
              color: appBar?.theme?.backgroundColor,
            ),
          ],
        ),
      ),
    );

    if (isRootScreen) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          expandedPadding,
          //Left side
          SizedBox(
            width: 200,
            child: Scaffold(
              appBar: appBar?.leftSideLeading,
              body: sideNavigationMenu,
            ),
          ),
          //Padding
          padding,
          SizedBox(
            width: 600,
            child: Scaffold(
              backgroundColor: theme.backgroundColor,
              key: scaffoldKey,
              appBar: appBar?.buildCenter ?? false ? appBar : null,
              body: KeyedSubtree(
                key: bodyKey,
                child: body,
              ),
            ),
          ),
          //Padding
          padding,
          //Right side
          SizedBox(
            width: 300,
            child: Scaffold(
              appBar: appBar?.rightSideLeading,
              body: rightSide == null
                  ? null
                  : KeyedSubtree(
                      key: rightBarKey,
                      child: rightSide!,
                    ),
            ),
          ),
          expandedPadding,
        ],
      );
    } else {
      return Scaffold(
        key: scaffoldKey,
        appBar: appBar?.buildCenter ?? false ? appBar : null,
        backgroundColor: theme.backgroundColor,
        body: KeyedSubtree(
          key: bodyKey,
          child: body,
        ),
      );
    }
  }
}

class _MediumScaffold extends StatelessWidget {
  const _MediumScaffold({
    this.appBar,
    required this.body,
    this.sideNavigationMenu,
    required this.bodyKey,
    this.rightSide,
    required this.rightBarKey,
    required this.scaffoldKey,
    required this.isRootScreen,
    required this.theme,
  });
  final TextlyAppBar? appBar;
  final Widget body;
  final SideNavigationMenu? sideNavigationMenu;
  final GlobalKey bodyKey;
  final Widget? rightSide;
  final GlobalKey rightBarKey;
  final GlobalKey scaffoldKey;

  final bool isRootScreen;
  final TextlyScafoldTheme theme;

  @override
  Widget build(BuildContext context) {
    final padding = SizedBox(
      width: 10,
      child: Column(
        children: [
          Container(
            height: appBar?.preferredSize.height ?? 0,
            color: appBar?.theme?.backgroundColor,
          ),
        ],
      ),
    );

    final expandedPadding = Expanded(
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: appBar?.preferredSize.height ?? 0,
              color: appBar?.theme?.backgroundColor,
            ),
          ],
        ),
      ),
    );
    if (isRootScreen) {
      return LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (constraints.maxWidth < 1150) padding,
            if (constraints.maxWidth >= 1150) expandedPadding,
            //Left side
            SizedBox(
              width: 200,
              child: Scaffold(
                appBar: appBar?.leftSideLeading,
                body: sideNavigationMenu,
              ),
            ),
            //Padding
            padding,
            //Body
            if (constraints.maxWidth >= 1150)
              SizedBox(
                width: 600,
                child: Scaffold(
                  backgroundColor: theme.backgroundColor,
                  key: scaffoldKey,
                  appBar: appBar?.buildCenter ?? false ? appBar : null,
                  body: KeyedSubtree(
                    key: bodyKey,
                    child: body,
                  ),
                ),
              ),

            if (constraints.maxWidth < 1150)
              Expanded(
                child: Scaffold(
                  backgroundColor: theme.backgroundColor,
                  key: scaffoldKey,
                  appBar: appBar?.buildCenter ?? false ? appBar : null,
                  body: KeyedSubtree(
                    key: bodyKey,
                    child: body,
                  ),
                ),
              ),

            //Padding
            padding,
            //Right side
            SizedBox(
              width: 300,
              child: Scaffold(
                appBar: appBar?.rightSideLeading,
                body: rightSide == null
                    ? null
                    : KeyedSubtree(
                        key: rightBarKey,
                        child: rightSide!,
                      ),
              ),
            ),
            if (constraints.maxWidth < 1150) padding,
            if (constraints.maxWidth >= 1150) expandedPadding,
          ],
        ),
      );
    } else {
      return Scaffold(
        key: scaffoldKey,
        appBar: appBar?.buildCenter ?? false ? appBar : null,
        backgroundColor: theme.backgroundColor,
        body: KeyedSubtree(
          key: bodyKey,
          child: body,
        ),
      );
    }
  }
}

class _SmallScaffold extends StatelessWidget {
  const _SmallScaffold({
    this.appBar,
    required this.body,
    this.sideNavigationMenu,
    required this.bodyKey,
    this.rightSide,
    required this.rightBarKey,
    required this.scaffoldKey,
    required this.isRootScreen,
    required this.theme,
  });
  final TextlyAppBar? appBar;
  final Widget body;
  final SideNavigationMenu? sideNavigationMenu;
  final GlobalKey bodyKey;
  final Widget? rightSide;
  final GlobalKey rightBarKey;
  final GlobalKey scaffoldKey;

  final bool isRootScreen;
  final TextlyScafoldTheme theme;
  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      final padding = SizedBox(
        width: 10,
        child: Column(
          children: [
            Container(
              height: appBar?.preferredSize.height ?? 0,
              color: appBar?.theme?.backgroundColor,
            ),
          ],
        ),
      );
      return LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            padding,
            //Left side
            SizedBox(
              width: 50,
              child: Scaffold(
                appBar: appBar?.leftSideLeading,
                body: sideNavigationMenu,
              ),
            ),
            //Padding
            padding,
            //Body
            if (constraints.maxWidth >= 1150)
              SizedBox(
                width: 600,
                child: Scaffold(
                  backgroundColor: theme.backgroundColor,
                  key: scaffoldKey,
                  appBar: appBar?.buildCenter ?? false ? appBar : null,
                  body: KeyedSubtree(
                    key: bodyKey,
                    child: body,
                  ),
                ),
              ),

            if (constraints.maxWidth < 1150)
              Expanded(
                child: Scaffold(
                  backgroundColor: theme.backgroundColor,
                  key: scaffoldKey,
                  appBar: appBar?.buildCenter ?? false ? appBar : null,
                  body: KeyedSubtree(
                    key: bodyKey,
                    child: body,
                  ),
                ),
              ),

            //Padding
            padding,
            //Right side
            Visibility(
              visible: constraints.maxWidth - 250 >= 500 + 20 + 50,
              child: SizedBox(
                width: 250,
                child: Scaffold(
                  appBar: appBar?.rightSideLeading,
                  body: rightSide == null
                      ? null
                      : KeyedSubtree(
                          key: rightBarKey,
                          child: rightSide!,
                        ),
                ),
              ),
            ),
            padding,
          ],
        ),
      );
    } else {
      return Scaffold(
        key: scaffoldKey,
        appBar: appBar?.buildCenter ?? false ? appBar : null,
        backgroundColor: theme.backgroundColor,
        body: KeyedSubtree(
          key: bodyKey,
          child: body,
        ),
      );
    }
  }
}

class _XSmallScaffold extends StatelessWidget {
  const _XSmallScaffold({
    required this.bodyKey,
    required this.body,
    this.buttomNavigationMenu,
    this.appBar,
    required this.theme,
    required this.scaffoldKey,
  });
  final GlobalKey bodyKey;
  final TextlyAppBar? appBar;
  final Widget body;
  final ButtomNavigationMenu? buttomNavigationMenu;
  final TextlyScafoldTheme theme;
  final GlobalKey scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBar?.buildCenter ?? false ? appBar : null,
      body: KeyedSubtree(
        key: bodyKey,
        child: body,
      ),
      bottomNavigationBar: buttomNavigationMenu,
    );
  }
}
