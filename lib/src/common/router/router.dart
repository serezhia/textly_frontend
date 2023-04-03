import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:textly/src/feature/feed/widget/feed_page.dart';
import 'package:textly/src/feature/global/widget/global_page.dart';
import 'package:textly/src/feature/home/widget/home_screen_widget.dart';
import 'package:textly/src/feature/post/widget/post_page.dart';
import 'package:textly/src/feature/profile/widget/profile_page.dart';
import 'package:textly/src/feature/write/widget/write_page.dart';
import 'package:textly_core/textly_core.dart';

class MainRouter {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get goRouter => GoRouter(
        navigatorKey: _rootNavigatorKey,
        debugLogDiagnostics: true,
        initialLocation: '/global',
        routes: [
          StatefulShellRoute(
            builder: (builder) => builder.buildShell(
              (context, state, child) => HomeScreen(
                location: state.location,
                child: child,
              ),
            ),
            branches: [
              StatefulShellBranch(
                initialLocation: '/global',
                routes: [
                  GoRoute(
                    path: '/global',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        key: state.pageKey,
                        child: const GlobalPage(),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: '/feed',
                routes: [
                  GoRoute(
                    path: '/feed',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        key: state.pageKey,
                        child: const FeedPage(),
                      );
                    },
                  ),
                ],
              ),
              StatefulShellBranch(
                initialLocation: '/profile',
                routes: [
                  GoRoute(
                    path: '/profile',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        key: state.pageKey,
                        child: const ProfilePage(
                          userId: null,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: '/write',
            builder: (context, state) => WritePage(
              key: state.pageKey,
            ),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: '/posts/:postId',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: PostPage(
                postId: int.tryParse(state.params['postId'] ?? '') ?? -1,
                post: state.extra as Post?,
              ),
            ),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: '/profiles/:userId',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: ProfilePage(
                userId: int.tryParse(state.params['userId'] ?? '') ?? -1,
              ),
            ),
          ),
        ],
      );
}
