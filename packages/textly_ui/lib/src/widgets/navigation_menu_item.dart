// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

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

class UltraNavigationMenuItem extends NavigationMenuItem {
  UltraNavigationMenuItem({
    this.isPush,
    this.isProtected,
    required super.lable,
    required super.icon,
    super.location,
  });

  final bool? isProtected;
  final bool? isPush;
}
