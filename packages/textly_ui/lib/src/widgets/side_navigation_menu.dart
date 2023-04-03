// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class SideNavigationMenu extends StatefulWidget {
  const SideNavigationMenu({
    required this.items,
    required this.onTap,
    required this.currentIndex,
    super.key,
  });

  final List<NavigationMenuItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  @override
  State<SideNavigationMenu> createState() => _SideNavigationMenuState();
}

class _SideNavigationMenuState extends State<SideNavigationMenu> {
  List<Widget> _createTiles(double maxWidth) {
    final tiles = <Widget>[];
    for (var i = 0; i < widget.items.length; i++) {
      tiles.add(
        _SideNavigationMenuItemWidget(
          isExpanded: maxWidth >= 200,
          navigationMenuItem: widget.items[i],
          isSelected: widget.currentIndex == i,
          onTap: () {
            widget.onTap?.call(i);
          },
        ),
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 200) {
          return SizedBox(
            width: 200,
            child: Column(children: _createTiles(constraints.maxWidth)),
          );
        } else {
          return SizedBox(
            width: 50,
            child: Column(children: _createTiles(constraints.maxWidth)),
          );
        }
      },
    );
  }
}

class NavigationMenuItem {
  NavigationMenuItem({
    required this.lable,
    required this.icon,
    this.location,
  });

  final String lable;
  final Widget icon;
  final String? location;
}

class _SideNavigationMenuItemWidget extends StatelessWidget {
  const _SideNavigationMenuItemWidget({
    required this.navigationMenuItem,
    required this.isExpanded,
    required this.isSelected,
    this.onTap,
  });

  final NavigationMenuItem navigationMenuItem;
  final bool isExpanded;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: isExpanded
            ? Row(
                children: [
                  navigationMenuItem.icon,
                  Text(
                    navigationMenuItem.lable,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              )
            : Container(
                child: navigationMenuItem.icon,
              ),
      ),
    );
  }
}
