import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:textly/src/feature/auth/model/user_model.dart';
import 'package:textly/src/feature/auth/widget/auth_scope.dart';
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

  final unAuthListNavItems = [
    NavigationMenuItem(
      lable: 'Global',
      icon: const Text('🌏'),
      location: '/global',
    ),
  ];
  final authListNavItems = [
    NavigationMenuItem(
      lable: 'Global',
      icon: const Text('🌏'),
      location: '/global',
    ),
    NavigationMenuItem(
      lable: 'Profile',
      icon: const Text('👤'),
      location: '/profile',
    ),
    NavigationMenuItem(
      lable: 'Write',
      icon: const Text('✍️'),
      location: '/write',
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
        ),
      ),
      theme: Theme.of(context).extension<TextlyScafoldTheme>(),
      rightSide: const Placeholder(),
      navigationRail: SideNavigationMenu(
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
