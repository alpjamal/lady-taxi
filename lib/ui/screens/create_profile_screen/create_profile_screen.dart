import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../home_screen/home_screen.dart';
import '../create_profile_screen/create_profile_widgest/input_field.dart';
import 'create_profile_widgest/profile_photo.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen(this.phoneNum, {super.key});
  final String phoneNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const LocaleText('create')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProfilePhoto(),
                  InputField(context.localeString('name')),
                  InputField(context.localeString('gender')),
                  InputField(phoneNum, enabled: false),
                  const SizedBox(height: 200),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
                      },
                      child: const LocaleText('continue'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}