import 'package:flutter/material.dart';
import 'package:textly/src/feature/home/widget/default_home_screen_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.userId,
  });
  final int? userId;
  @override
  Widget build(BuildContext context) {
    if (userId == null) {
      return Placeholder(
        child: userId != null
            ? Text('Profile_page userId: $userId')
            : const Text('Profile_page'),
      );
    } else {
      return DefaultHomeScreen(
        title: 'Profile',
        child: Placeholder(child: Text('Profile_page userId: $userId')),
      );
    }
  }
}
