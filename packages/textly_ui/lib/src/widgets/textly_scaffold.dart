// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:textly_ui/src/consts/consts.dart';
import 'package:textly_ui/src/theme/textly_scaffold_theme.dart';
import 'package:textly_ui/textly_ui.dart';

class TextlyScaffold extends StatefulWidget {
  const TextlyScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.buttomNavigationBar,
    this.navigationRail,
    this.rightSide,
    this.isRootScreen = false,
    this.theme,
  });

  final bool isRootScreen;

  final TextlyAppBar? appBar;
  final Widget body;
  final TextlyScafoldTheme? theme;
  final Widget? buttomNavigationBar;
  final Widget? navigationRail;

  final Widget? rightSide;

  @override
  State<TextlyScaffold> createState() => _TextlyScaffoldState();
}

class _TextlyScaffoldState extends State<TextlyScaffold> {
  final unKey = UniqueKey();
  final bodyKey = GlobalKey();
  final rightBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme?.backgroundColor,
      body: LayoutBuilder(
        builder: (context, contraints) {
          if (contraints.maxWidth >= ScreenSize.extraLarge.min) {
            return _XLargeScaffold(
              isRootScreen: widget.isRootScreen,
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
            );
          } else if (contraints.maxWidth >= ScreenSize.large.min) {
            return _LargeScaffold(
              isRootScreen: widget.isRootScreen,
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
            );
          } else if (contraints.maxWidth >= ScreenSize.medium.min) {
            return _MediumScaffold(
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
              isRootScreen: widget.isRootScreen,
            );
          } else if (contraints.maxWidth >= ScreenSize.small.min) {
            return _SmallScaffold(
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              isRootScreen: widget.isRootScreen,
              rightSide: widget.rightSide,
              rightSideKey: rightBarKey,
            );
          } else {
            return _XSmallScaffold(
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              bottomNavigationBar: widget.buttomNavigationBar,
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
    this.navigationRail,
    this.rightSide,
    this.appBar,
    required this.rightBarKey,
    required this.isRootScreen,
  });
  final GlobalKey bodyKey;
  final GlobalKey rightBarKey;
  final TextlyAppBar? appBar;
  final Widget body;
  final Widget? navigationRail;
  final Widget? rightSide;
  final bool isRootScreen;
  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      return Stack(
        children: [
          if (isRootScreen && appBar != null)
            Container(
              height: appBar?.heightAppBar,
              color: appBar?.colorAppBar,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              if (navigationRail != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Column(
                    children: [
                      if (appBar != null)
                        SizedBox(
                          height: appBar?.heightAppBar,
                          child: const Center(
                            child: longLogo,
                          ),
                        ),
                      Expanded(child: navigationRail!),
                    ],
                  ),
                ),
              const SizedBox(width: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    if (appBar != null)
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: appBar?.heightAppBar ?? double.infinity,
                        ),
                        child: appBar?.appBar,
                      ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 600),
                        child: KeyedSubtree(key: bodyKey, child: body),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (rightSide != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                  ),
                  child: Column(
                    children: [
                      if (appBar != null)
                        SizedBox(
                          height: appBar?.heightAppBar,
                        ),
                      Expanded(
                        child: KeyedSubtree(
                          key: rightBarKey,
                          child: rightSide!,
                        ),
                      )
                    ],
                  ),
                ),
              const Expanded(child: SizedBox(width: 10)),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          if (appBar != null)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: appBar?.heightAppBar ?? double.infinity,
              ),
              child: appBar?.appBar,
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: KeyedSubtree(key: bodyKey, child: body),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _LargeScaffold extends StatelessWidget {
  const _LargeScaffold({
    required this.body,
    this.navigationRail,
    this.rightSide,
    this.appBar,
    required this.bodyKey,
    required this.rightBarKey,
    required this.isRootScreen,
  });

  final TextlyAppBar? appBar;
  final Widget body;
  final Widget? navigationRail;
  final GlobalKey bodyKey;
  final Widget? rightSide;
  final GlobalKey rightBarKey;
  final bool isRootScreen;
  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      return Stack(
        children: [
          if (isRootScreen && appBar != null)
            Container(
              height: appBar?.heightAppBar,
              color: appBar?.colorAppBar,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (navigationRail != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Column(
                    children: [
                      if (appBar != null)
                        SizedBox(
                          height: appBar?.heightAppBar,
                          child: const Center(
                            child: longLogo,
                          ),
                        ),
                      Expanded(child: navigationRail!),
                    ],
                  ),
                ),
              const SizedBox(width: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    if (appBar != null)
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: appBar?.heightAppBar ?? double.infinity,
                        ),
                        child: appBar?.appBar,
                      ),
                    Expanded(
                      child: KeyedSubtree(key: bodyKey, child: body),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              if (rightSide != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  child: Column(
                    children: [
                      if (appBar != null)
                        SizedBox(
                          height: appBar?.heightAppBar,
                        ),
                      Expanded(
                        child: KeyedSubtree(
                          key: rightBarKey,
                          child: rightSide!,
                        ),
                      )
                    ],
                  ),
                ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          if (appBar != null)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: appBar?.heightAppBar ?? double.infinity,
              ),
              child: appBar?.appBar,
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: KeyedSubtree(key: bodyKey, child: body),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _MediumScaffold extends StatelessWidget {
  const _MediumScaffold({
    required this.body,
    this.appBar,
    this.navigationRail,
    required this.bodyKey,
    this.rightSide,
    required this.rightBarKey,
    required this.isRootScreen,
  });
  final GlobalKey bodyKey;
  final TextlyAppBar? appBar;
  final Widget body;
  final Widget? navigationRail;
  final Widget? rightSide;
  final GlobalKey rightBarKey;
  final bool isRootScreen;

  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      return LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            if (isRootScreen && appBar != null)
              Container(
                height: appBar?.heightAppBar,
                color: appBar?.colorAppBar,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (navigationRail != null)
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                    ),
                    child: Column(
                      children: [
                        if (appBar != null)
                          SizedBox(
                            height: appBar?.heightAppBar,
                            child: const Center(
                              child: longLogo,
                            ),
                          ),
                        Expanded(child: navigationRail!),
                      ],
                    ),
                  ),
                const SizedBox(width: 10),
                if (constraints.maxWidth >= 1150)
                  SizedBox(
                    width: 600,
                    child: Column(
                      children: [
                        if (appBar != null)
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  appBar?.heightAppBar ?? double.infinity,
                            ),
                            child: appBar?.appBar,
                          ),
                        Expanded(
                          child: KeyedSubtree(key: bodyKey, child: body),
                        ),
                      ],
                    ),
                  ),
                if (constraints.maxWidth < 1150)
                  Expanded(
                    child: Column(
                      children: [
                        if (appBar != null)
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  appBar?.heightAppBar ?? double.infinity,
                            ),
                            child: appBar?.appBar,
                          ),
                        Expanded(
                          child: KeyedSubtree(key: bodyKey, child: body),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(width: 10),
                if (rightSide != null)
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                    ),
                    child: Column(
                      children: [
                        if (appBar != null)
                          SizedBox(
                            height: appBar?.heightAppBar,
                          ),
                        Expanded(
                          child: KeyedSubtree(
                            key: rightBarKey,
                            child: rightSide!,
                          ),
                        )
                      ],
                    ),
                  ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          if (appBar != null)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: appBar?.heightAppBar ?? double.infinity,
              ),
              child: appBar?.appBar,
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: KeyedSubtree(key: bodyKey, child: body),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _SmallScaffold extends StatelessWidget {
  const _SmallScaffold({
    this.appBar,
    required this.body,
    this.navigationRail,
    required this.bodyKey,
    required this.isRootScreen,
    required this.rightSide,
    required this.rightSideKey,
  });
  final TextlyAppBar? appBar;
  final Widget body;
  final Widget? navigationRail;
  final Widget? rightSide;
  final GlobalKey rightSideKey;
  final GlobalKey bodyKey;
  final bool isRootScreen;
  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      return Stack(
        children: [
          if (isRootScreen && appBar != null)
            Container(
              height: appBar?.heightAppBar,
              color: appBar?.colorAppBar,
            ),
          LayoutBuilder(
            builder: (context, constraints) => Row(
              children: [
                if (navigationRail != null)
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 75,
                    ),
                    child: Column(
                      children: [
                        if (appBar != null)
                          SizedBox(
                            height: appBar?.heightAppBar,
                            child: const Center(
                              child: shortLogo,
                            ),
                          ),
                        Expanded(child: navigationRail!),
                      ],
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      if (appBar != null)
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: appBar?.heightAppBar ?? double.infinity,
                          ),
                          child: appBar?.appBar,
                        ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: KeyedSubtree(key: bodyKey, child: body),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                if (rightSide != null)
                  Visibility(
                    visible: constraints.maxWidth - 250 >= 500 + 20 + 50,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 250,
                      ),
                      child: Column(
                        children: [
                          if (appBar != null)
                            SizedBox(
                              height: appBar?.heightAppBar,
                            ),
                          Expanded(
                            child: KeyedSubtree(
                              key: rightSideKey,
                              child: rightSide!,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          if (appBar != null)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: appBar?.heightAppBar ?? double.infinity,
              ),
              child: appBar?.appBar,
            ),
          Expanded(
            child: Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: KeyedSubtree(key: bodyKey, child: body),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class _XSmallScaffold extends StatelessWidget {
  const _XSmallScaffold({
    required this.bodyKey,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
  });
  final GlobalKey bodyKey;
  final TextlyAppBar? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (appBar != null)
          Container(
            height: appBar?.heightAppBar,
            color: appBar?.colorAppBar,
          ),
        Column(
          children: [
            if (appBar != null)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: appBar?.heightAppBar ?? double.infinity,
                ),
                child: appBar?.appBar,
              ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: KeyedSubtree(key: bodyKey, child: body),
                  ),
                ],
              ),
            ),
            if (bottomNavigationBar != null)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 60 + MediaQuery.of(context).padding.bottom,
                ),
                child: bottomNavigationBar,
              )
          ],
        ),
      ],
    );
  }
}
