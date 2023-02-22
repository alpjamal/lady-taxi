import 'package:flutter/material.dart';
import './constants.dart';

class LadyTaxiTheme {
  final themeData = ThemeData(
    primaryColor: LadyTaxiColors.primaryColor,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 80,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
    ),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStatePropertyAll<Color>(LadyTaxiColors.primaryColor),
      ),
    ),
    fontFamily: 'Roboto',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: LadyTaxiColors.primaryWithOpacity10,
        backgroundColor: LadyTaxiColors.primaryColor,
        elevation: 0,
        textStyle: LadyTaxiTextStyles.defaultStyle,
        minimumSize: const Size.fromHeight(50),
        shape: const StadiumBorder(),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: LadyTaxiColors.inputFill,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LadyTaxiColors.inputBorder),
        borderRadius: BorderRadius.all(LadyTaxiRadiuses.input),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LadyTaxiColors.primaryWithOpacity30),
        borderRadius: BorderRadius.all(LadyTaxiRadiuses.input),
      ),
    ),
  );
}
