// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/ui/screens/create_profile_screen.dart';
import 'package:lady_taxi/ui/screens/home_screen/home_screen.dart';

import './utils/theme.dart';
import 'ui/screens/onboarding_screen.dart';
// import 'ui/screens/registry_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ru', 'uz']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        theme: LadyTaxiTheme().themeData,
        // home: const OnboardingScreen(),
        home:  const ProfileScreen(''),
        // home:  const HomeScreen(),
      ),
    );
  }
}
