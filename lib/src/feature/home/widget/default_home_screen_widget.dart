import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:textly/src/feature/auth/bloc/auth_bloc.dart';
import 'package:textly/src/feature/auth/lego/auth_lego_widget.dart';
import 'package:textly/src/feature/auth/widget/auth_dialog.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';
import 'package:textly/src/feature/home/widget/fab.dart';
import 'package:textly/src/feature/home/widget/logo.dart';
import 'package:textly_ui/textly_ui.dart';

class DefaultHomeScreen extends StatefulWidget {
  const DefaultHomeScreen({
    required this.child,
    super.key,
    required this.title,
    this.location = '',
  });

  final Widget child;
  final String title;
  final String location;

  @override
  State<DefaultHomeScreen> createState() => _DefaultHomeScreenState();
}

class _DefaultHomeScreenState extends State<DefaultHomeScreen> {
  int _currentIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  final buttomListNavItems = [
    UltraNavigationMenuItem(
      lable: 'Global',
      icon: const Text('🌏'),
      location: '/global',
      isProtected: false,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Feed',
      icon: const Text('🔥'),
      location: '/feed',
      isProtected: true,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Notification',
      icon: const Text('🔔'),
      location: '/notification',
      isProtected: true,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Profile',
      icon: const Text('👤'),
      location: '/profile',
      isProtected: true,
      isPush: false,
    ),
  ];

  final unAuthListNavItems = [
    UltraNavigationMenuItem(
      lable: 'Global',
      icon: const Text('🌏'),
      location: '/global',
      isProtected: false,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Settings',
      icon: const Text('⚙️'),
      location: '/settings',
      isProtected: false,
      isPush: true,
    ),
  ];
  final authListNavItems = [
    UltraNavigationMenuItem(
      lable: 'Global',
      icon: const Text('🌏'),
      location: '/global',
      isProtected: false,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Feed',
      icon: const Text('🔥'),
      location: '/feed',
      isProtected: true,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Notification',
      icon: const Text('🔔'),
      location: '/notification',
      isProtected: true,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Profile',
      icon: const Text('👤'),
      location: '/profile',
      isProtected: true,
      isPush: false,
    ),
    UltraNavigationMenuItem(
      lable: 'Settings',
      icon: const Text('⚙️'),
      location: '/settings',
      isProtected: true,
      isPush: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isAuthenticatedWithProfile =
        context.watch<AuthenticationBLoC>().state.withProfile;

    return TextlyScaffold(
      appBar: TextlyAppBar(
        leading: MediaQuery.of(context).size.width < 600
            ? BackButton(
                onPressed: () {
                  if (GoRouter.of(context).canPop()) {
                    GoRouter.of(context).pop();
                  } else {
                    context.go('/global');
                  }
                },
              )
            : null,
        title: Text(widget.title),
        theme: Theme.of(context).extension<TextlyAppbarTheme>(),
        leftSideLeading: AppBarSideLeading(
          child: const LogoWidget(),
        ),
        rightSideLeading: AppBarSideLeading(
          child: Row(
            children: [
              if (!AuthenticationScope.isAuthenticatedWithProfileOf(
                context,
                listen: true,
              ))
                TextButton(
                  child: const Text('SignIn'),
                  onPressed: () async {
                    await showDialog<void>(
                      context: context,
                      builder: (context) => const AuthDialog(),
                    );
                  },
                ),
              if (AuthenticationScope.authenticatedOrNullOf(
                    context,
                    listen: true,
                  ) !=
                  null)
                TextButton(
                  child: const Text('Logout'),
                  onPressed: () async {
                    AuthenticationScope.logOut(context);
                  },
                ),
            ],
          ),
        ),
      ),
      theme: Theme.of(context).extension<TextlyScafoldTheme>(),
      rightSide: ListView(
        children: const [
          SizedBox(height: 20),
          AuthLegoWidget(),
        ],
      ),
      sideNavigationMenu: SideNavigationMenu(
        fab: const FABWidget(),
        items:
            isAuthenticatedWithProfile ? authListNavItems : unAuthListNavItems,
        onTap: (index) {
          final item = (isAuthenticatedWithProfile
              ? authListNavItems
              : unAuthListNavItems)[index];
          if (item.location != null) {
            if (item.isPush ?? false) {
              context.push(item.location!);
            } else {
              context.go(item.location!);
            }
          }
          setState(() {});
        },
        currentIndex: _currentIndex,
      ),
      isRootScreen: true,
      body: widget.child,
    );
  }
}
