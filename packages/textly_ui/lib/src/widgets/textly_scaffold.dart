// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:textly_ui/src/consts/consts.dart';

class TextlyScaffold extends StatefulWidget {
  const TextlyScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.buttomNavigationBar,
    this.navigationRail,
    this.rightSide,
    required this.isRootScreen,
  });

  final bool isRootScreen;

  final Widget? appBar;
  final Widget body;

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
      body: LayoutBuilder(
        builder: (context, contraints) {
          if (contraints.maxWidth >= 1200) {
            return _XLargeScaffold(
              isRootScreen: widget.isRootScreen,
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
            );
          } else if (contraints.maxWidth >= 922) {
            return _LargeScaffold(
              isRootScreen: widget.isRootScreen,
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
            );
          } else if (contraints.maxWidth >= 800) {
            return _MediumScaffold(
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              rightSide: widget.rightSide,
              rightBarKey: rightBarKey,
              isRootScreen: widget.isRootScreen,
            );
          } else if (contraints.maxWidth >= 576) {
            return _SmallScaffold(
              bodyKey: bodyKey,
              appBar: widget.appBar,
              body: widget.body,
              navigationRail: widget.navigationRail,
              isRootScreen: widget.isRootScreen,
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
  final Widget? appBar;
  final Widget body;
  final Widget? navigationRail;
  final Widget? rightSide;
  final bool isRootScreen;
  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      return Stack(
        children: [
          if (isRootScreen) Container(height: heightAppBar, color: colorAppBar),
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
                      const SizedBox(
                        height: heightAppBar,
                        child: Center(
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
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxHeight: heightAppBar),
                      child: appBar,
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
                      Container(
                        height: heightAppBar,
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
              constraints: const BoxConstraints(maxHeight: heightAppBar),
              child: appBar,
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

  final Widget? appBar;
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
          if (isRootScreen) Container(height: heightAppBar, color: colorAppBar),
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
                      const SizedBox(
                        height: heightAppBar,
                        child: Center(
                          child: longLogo,
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
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxHeight: heightAppBar),
                      child: appBar,
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
                      Container(
                        height: heightAppBar,
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
              constraints: const BoxConstraints(maxHeight: heightAppBar),
              child: appBar,
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
  final Widget? appBar;
  final Widget body;
  final Widget? navigationRail;
  final Widget? rightSide;
  final GlobalKey rightBarKey;
  final bool isRootScreen;

  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      return Stack(
        children: [
          if (isRootScreen) Container(height: heightAppBar, color: colorAppBar),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (navigationRail != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 75,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: heightAppBar,
                        child: Center(
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
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxHeight: heightAppBar),
                      child: appBar,
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
                      Container(
                        height: heightAppBar,
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
              constraints: const BoxConstraints(maxHeight: heightAppBar),
              child: appBar,
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
  });
  final Widget? appBar;
  final Widget body;
  final Widget? navigationRail;
  final GlobalKey bodyKey;
  final bool isRootScreen;
  @override
  Widget build(BuildContext context) {
    if (isRootScreen) {
      return Stack(
        children: [
          Container(height: heightAppBar, color: colorAppBar),
          Row(
            children: [
              if (navigationRail != null)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 75,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: heightAppBar,
                        child: Center(
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
                        constraints:
                            const BoxConstraints(maxHeight: heightAppBar),
                        child: appBar,
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
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          if (appBar != null)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: heightAppBar),
              child: appBar,
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
  final Widget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: heightAppBar, color: colorAppBar),
        Column(
          children: [
            if (appBar != null)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: heightAppBar + MediaQuery.of(context).padding.top,
                ),
                child: appBar,
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
