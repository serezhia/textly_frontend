// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:textly_ui/src/widgets/navigation_menu_item.dart';

class SideNavigationMenu extends StatefulWidget {
  const SideNavigationMenu({
    required this.items,
    required this.onTap,
    required this.currentIndex,
    this.fab,
    super.key,
  });

  final List<NavigationMenuItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final Widget? fab;

  @override
  State<SideNavigationMenu> createState() => _SideNavigationMenuState();
}

class _SideNavigationMenuState extends State<SideNavigationMenu> {
  List<Widget> _createTiles(double maxWidth) {
    final tiles = <_SideNavigationMenuItemWidget>[];
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
      builder: (context, constraints) => SizedBox(
        width: constraints.maxWidth >= 200 ? 200 : 50,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: constraints.maxWidth >= 200
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              ..._createTiles(constraints.maxWidth),
              if (widget.fab != null)
                Padding(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth >= 200 ? 35 : 0,
                    top: 30,
                  ),
                  child: widget.fab,
                ),
            ],
          ),
        ),
      ),
    );
  }
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
        padding: EdgeInsets.only(left: isExpanded ? 35 : 0, top: 30),
        child: isExpanded
            ? Row(
                children: [
                  Opacity(
                    opacity: isSelected ? 1 : 0.3,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      child: navigationMenuItem.icon,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    navigationMenuItem.lable,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 20,
                      fontFamily: 'TT Norms Pro',
                    ),
                  ),
                ],
              )
            : DefaultTextStyle(
                style: const TextStyle(fontSize: 20),
                child: Opacity(
                  opacity: isSelected ? 1 : 0.3,
                  child: navigationMenuItem.icon,
                ),
              ),
      ),
    );
  }
}
