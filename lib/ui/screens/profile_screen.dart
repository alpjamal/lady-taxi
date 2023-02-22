import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(this.phoneNum, {super.key});
  final String phoneNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil yaratish')),
      body: Center(
        child: Text(phoneNum),
      ),
    );
  }
}
