import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:textly/src/feature/feed/widget/feed_page.dart';
import 'package:textly/src/feature/global/widget/global_page.dart';
import 'package:textly/src/feature/home/widget/home_screen_widget.dart';
import 'package:textly/src/feature/notification/widgets/notification_page.dart';
import 'package:textly/src/feature/post/widget/post_page.dart';
import 'package:textly/src/feature/profile/widget/profile_page.dart';
import 'package:textly/src/feature/settings/widgets/settings_page.dart';
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
            // builder: (builder) => builder.buildShell(
            //   (context, state, child) => HomeScreen(
            //     location: state.location,
            //     child: child,
            //   ),
            // ),
            pageBuilder: (navigatorBuilder) => NoTransitionPage(
              child: navigatorBuilder.buildShell(
                (context, state, child) => HomeScreen(
                  location: state.location,
                  child: child,
                ),
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
                initialLocation: '/notification',
                routes: [
                  GoRoute(
                    path: '/notification',
                    pageBuilder: (context, state) {
                      return NoTransitionPage(
                        key: state.pageKey,
                        child: const NotificationPage(),
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
            path: '/signin',
            pageBuilder: (context, state) => MaterialPage(
              allowSnapshotting: false,
              child: AlertDialog(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: Colors.white,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Войдите, чтобы быть в курсе событий'),
                    const SizedBox(height: 20),
                    const TextField(),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Отправить код'),
                    ),
                  ],
                ),
              ),
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
            path: '/settings',
            pageBuilder: (context, state) =>
                MediaQuery.of(context).size.width >= 599
                    ? NoTransitionPage(
                        key: state.pageKey,
                        child: const SettingsPage(),
                      )
                    : CupertinoPage(
                        key: state.pageKey,
                        child: const SettingsPage(),
                      ),
          ),
          GoRoute(
            parentNavigatorKey: _rootNavigatorKey,
            path: '/profiles/:userId',
            pageBuilder: (context, state) => MediaQuery.of(context)
                        .size
                        .width >=
                    599
                ? NoTransitionPage(
                    key: state.pageKey,
                    child: ProfilePage(
                      userId: int.tryParse(state.params['userId'] ?? '') ?? -1,
                    ),
                  )
                : CupertinoPage(
                    key: state.pageKey,
                    child: ProfilePage(
                      userId: int.tryParse(state.params['userId'] ?? '') ?? -1,
                    ),
                  ),
          ),
        ],
      );
}
