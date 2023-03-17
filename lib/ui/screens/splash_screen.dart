import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';
import '/ui/screens/loading_screen.dart';
import 'onboarding_screen/onboarding_screen.dart';

class LadyTaxiSplashScreen extends StatelessWidget {
  const LadyTaxiSplashScreen({super.key});

  Future<bool?> _isFirstInstall() async {
    var prefs = await SharedPreferences.getInstance();
    bool? isFirstInstall = prefs.getBool(LtPrefs.isInitial);
    return isFirstInstall;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isFirstInstall(),
      builder: (_, snapshot) {
        return EasySplashScreen(
          logo: Image.asset('assets/icons/lady_taxi_logo.png'),
          durationInSeconds: 1,
          navigator: snapshot.data ?? true ? const OnboardingScreen() : const LoadingScreen(),
          logoWidth: 100,
          showLoader: false,
        );
      },
    );
  }
}
