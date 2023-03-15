import 'package:flutter/material.dart';
import './constants.dart';

class LadyTaxiTheme {
  final themeData = ThemeData(
    primaryColor: LTColors.primary,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
      titleTextStyle: LTTextStyle.appbarStyle,
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(LTColors.primary),
      ),
    ),
    fontFamily: 'Roboto',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: LTColors.primaryWithOpacity10,
        backgroundColor: LTColors.primary,
        elevation: 0,
        textStyle: LTTextStyle.defaultStyle,
        minimumSize: const Size.fromHeight(50),
        shape: const StadiumBorder(),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: LTColors.inputFill,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(LTRadius.input),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LTColors.primaryWithOpacity30),
        borderRadius: BorderRadius.all(LTRadius.input),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: LTColors.primary,
      showCloseIcon: true,
      closeIconColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(LTRadius.snackBar)),
    ),
  );

  static const Color sec = LTColors.primary;
  final themeData1 = ThemeData(
    primaryColor: sec,
    scaffoldBackgroundColor: Colors.grey.shade900,
    drawerTheme: DrawerThemeData(backgroundColor: Colors.grey.shade900),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: LTTextStyle.darkAppbarStyle,
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(sec),
      ),
    ),
    fontFamily: 'Roboto',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: LTColors.primaryWithOpacity10,
        backgroundColor: sec,
        elevation: 0,
        textStyle: LTTextStyle.defaultStyle,
        minimumSize: const Size.fromHeight(50),
        shape: const StadiumBorder(),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade800,
      hintStyle: const TextStyle(color: Colors.white),
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(LTRadius.input),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0)),
        borderRadius: const BorderRadius.all(LTRadius.input),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey.shade900,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: sec,
      showCloseIcon: true,
      closeIconColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(LTRadius.snackBar)),
    ),
  );
}
