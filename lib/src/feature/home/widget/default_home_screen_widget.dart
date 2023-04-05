import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:textly/src/feature/auth/lego/auth_lego_widget.dart';
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

  final unAuthListNavItems = [
    NavigationMenuItem(
      lable: 'Global',
      icon: const Text('🌏'),
      location: '/global',
    ),
    NavigationMenuItem(
      lable: 'Settings',
      icon: const Text('⚙️'),
      location: '/settings',
    ),
  ];
  final authListNavItems = [
    NavigationMenuItem(
      lable: 'Global',
      icon: const Text('🌏'),
      location: '/global',
    ),
    NavigationMenuItem(
      lable: 'Feed',
      icon: const Text('🔥'),
      location: '/feed',
    ),
    NavigationMenuItem(
      lable: 'Notification',
      icon: const Text('🔔'),
      location: '/notification',
    ),
    NavigationMenuItem(
      lable: 'Profile',
      icon: const Text('👤'),
      location: '/profile',
    ),
    NavigationMenuItem(
      lable: 'Settings',
      icon: const Text('⚙️'),
      location: '/settings',
    ),
  ];
  @override
  void initState() {
    final user = AuthenticationScope.authenticatedWithProfileOrNullOf(
      context,
    );
    if (user == null) {
      for (var i = 0; i < unAuthListNavItems.length; i++) {
        if (unAuthListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
      }
    } else {
      for (var i = 0; i < authListNavItems.length; i++) {
        if (authListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
      }
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final user = AuthenticationScope.authenticatedWithProfileOrNullOf(
      context,
    );
    if (user == null) {
      for (var i = 0; i < unAuthListNavItems.length; i++) {
        if (unAuthListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
      }
    } else {
      for (var i = 0; i < authListNavItems.length; i++) {
        if (authListNavItems[i].location!.contains(widget.location)) {
          _currentIndex = i;
        }
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthenticationScope.authenticatedWithProfileOrNullOf(
      context,
      listen: true,
    );
    return TextlyScaffold(
      appBar: TextlyAppBar(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            AuthenticationScope.authenticatedOrNullOf(
                      context,
                      listen: true,
                    ) !=
                    null
                ? authListNavItems[_currentIndex].lable
                : unAuthListNavItems[_currentIndex].lable,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        leftSideLeading: const LogoWidget(),
        rightSideLeading: Row(
          children: [
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
        items: user == null ? unAuthListNavItems : authListNavItems,
        onTap: (index) {
          _currentIndex = index;
          final item =
              (user == null ? unAuthListNavItems : authListNavItems)[index];
          if (item.location != null) {
            context.go(item.location!);
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
