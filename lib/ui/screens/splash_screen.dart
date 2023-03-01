import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:lady_taxi/ui/screens/onboarding_screen.dart';

class LadyTaxiSplashScreen extends StatelessWidget {
  const LadyTaxiSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/icons/lady_taxi_logo.png'),
      durationInSeconds: 1,
      navigator: const OnboardingScreen(),
      logoWidth: 100,
      showLoader: false,
    );
  }
}
