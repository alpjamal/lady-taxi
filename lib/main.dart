import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/data/BLoC/user/user_bloc.dart';
import 'package:lady_taxi/data/cubit/theme_cubit/theme_cubit.dart';
import 'package:lady_taxi/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './data/BLoC/auth/auth_bloc.dart';
import './utils/theme.dart';
import 'ui/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ru', 'uz']);
  var prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool(LtPrefs.isThemeDark) ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => UserBloc()..add(GetUserEvent())),
        BlocProvider(create: (context) => ThemeCubit()..getTheme(isDark)),
        BlocProvider(create: (ctx) => AuthBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = BlocProvider.of<ThemeCubit>(context, listen: true).isDark;
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        debugShowCheckedModeBanner: false,
        theme: isDark ? LadyTaxiTheme.dark : LadyTaxiTheme.light,
        home: const LadyTaxiSplashScreen(),
      ),
    );
  }
}
