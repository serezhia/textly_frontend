// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:textly_ui/src/widgets/navigation_menu_item.dart';

class ButtomNavigationMenu extends StatefulWidget {
  const ButtomNavigationMenu({
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
  State<ButtomNavigationMenu> createState() => _ButtomNavigationMenuState();
}

class _ButtomNavigationMenuState extends State<ButtomNavigationMenu> {
  List<Widget> _createTiles() {
    final tiles = <Widget>[];
    for (var i = 0; i < widget.items.length; i++) {
      tiles.add(
        _ButtomNavigationMenuItemWidget(
          navigationMenuItem: widget.items[i],
          isSelected: widget.currentIndex == i,
          onTap: () {
            widget.onTap?.call(i);
          },
        ),
      );
    }
    if (widget.fab != null) {
      tiles.insert(
        (widget.items.length / 2).floor(),
        Expanded(child: widget.fab!),
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    final additionalBottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      color: Colors.white,
      height: additionalBottomPadding + kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _createTiles(),
      ),
    );
  }
}

class _ButtomNavigationMenuItemWidget extends StatelessWidget {
  const _ButtomNavigationMenuItemWidget({
    required this.navigationMenuItem,
    required this.isSelected,
    this.onTap,
  });

  final NavigationMenuItem navigationMenuItem;

  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final additionalBottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        // ignore: use_colored_box
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 5),
              Text(
                navigationMenuItem.lable,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'TT Norms Pro',
                ),
              ),
              SizedBox(
                height: additionalBottomPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
