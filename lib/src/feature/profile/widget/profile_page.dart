import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.userId,
  });
  final int? userId;
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('Profile_page'),
    );
  }
}
