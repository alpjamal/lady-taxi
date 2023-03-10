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
}
