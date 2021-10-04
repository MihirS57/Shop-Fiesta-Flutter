import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '\profile-screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Text('Profile Screen'),
      ),
    );
  }
}
