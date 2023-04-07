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

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.child,
    required this.location,
    super.key,
  });

  final Widget child;
  final String location;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = -1;

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
  void initState() {
    final isAuthenticatedWithProfile =
        context.read<AuthenticationBLoC>().state.withProfile;

    if (isAuthenticatedWithProfile) {
      for (var i = 0; i < authListNavItems.length; i++) {
        if (authListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
      }
    } else {
      for (var i = 0; i < unAuthListNavItems.length; i++) {
        if (unAuthListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
      }
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final isAuthenticatedWithProfile =
        context.read<AuthenticationBLoC>().state.withProfile;

    if (isAuthenticatedWithProfile) {
      for (var i = 0; i < authListNavItems.length; i++) {
        if (authListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
      }
    } else {
      for (var i = 0; i < unAuthListNavItems.length; i++) {
        if (unAuthListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
        if (_currentIndex > unAuthListNavItems.length) {
          _currentIndex = -1;
        }
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isAuthenticatedWithProfile =
        context.watch<AuthenticationBLoC>().state.withProfile;

    return TextlyScaffold(
      appBar: TextlyAppBar(
        theme: Theme.of(context).extension<TextlyAppbarTheme>(),
        leftSideLeading: const LogoWidget(),
        rightSideLeading: Row(
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
      theme: Theme.of(context).extension<TextlyScafoldTheme>(),
      rightSide: ListView(
        children: const [
          SizedBox(height: 20),
          AuthLegoWidget(),
        ],
      ),
      navigationRail: SideNavigationMenu(
        fab: const FABWidget(),
        items:
            isAuthenticatedWithProfile ? authListNavItems : unAuthListNavItems,
        onTap: (index) {
          _currentIndex = index;
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
      buttomNavigationBar: ButtomNavigationMenu(
        currentIndex: _currentIndex,
        items: buttomListNavItems,
        onTap: (index) async {
          if (AuthenticationScope.authenticatedWithProfileOrNullOf(context) ==
                  null &&
              (buttomListNavItems[index].isProtected ?? false)) {
            await showDialog<void>(
              context: context,
              builder: (context) => const AuthDialog(),
            );
            return;
          }
          _currentIndex = index;
          final item = (isAuthenticatedWithProfile
              ? authListNavItems
              : unAuthListNavItems)[index];
          if (item.location != null) {
            context.go(item.location!);
          }
          setState(() {});
        },
      ),
      isRootScreen: true,
      body: widget.child,
    );
  }
}
