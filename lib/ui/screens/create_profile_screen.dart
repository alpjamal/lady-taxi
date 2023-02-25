import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import './home_screen/home_screen.dart';
import '../widgets/create_profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(this.phoneNum, {super.key});
  final String phoneNum;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const LocaleText('create')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProfilePhoto(),
                  InputField(context.localeString('name')),
                  InputField(context.localeString('birthdate')),
                  InputField(phoneNum, enabled: false),
                  // const Spacer(),
                  const SizedBox(height: 200),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (context) =>  const HomeScreen()));
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
