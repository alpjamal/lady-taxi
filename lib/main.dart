import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/data/BLoC/user/user_bloc.dart';
import 'package:lady_taxi/data/cubit/theme_cubit.dart';

import './data/BLoC/auth/auth_bloc.dart';
import './utils/theme.dart';
import 'ui/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ru', 'uz']);
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return LocaleBuilder(
      builder: (locale) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => AuthBloc()),
          BlocProvider(create: (ctx) => UserBloc()..add(GetUserEvent())),
        ],
        child: MaterialApp(
          localizationsDelegates: Locales.delegates,
          supportedLocales: Locales.supportedLocales,
          locale: locale,
          debugShowCheckedModeBanner: false,
          theme: theme.isdark ? LadyTaxiTheme().themeData1 : LadyTaxiTheme().themeData,
          home: const LadyTaxiSplashScreen(),
        ),
      ),
    );
  }
}
