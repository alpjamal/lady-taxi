import 'package:flutter/material.dart';

import './utils/theme.dart';
import 'ui/screens/onboarding_screen.dart';
// import 'ui/screens/registry_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kthemeData,
      home: const OnboardingScreen(),
    );
  }
}
