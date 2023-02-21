import 'package:flutter/material.dart';
import './constants.dart';

final kthemeData = ThemeData(
  primaryColor: kPrimaryColor,
  appBarTheme: const AppBarTheme(
    toolbarHeight: 80,
    backgroundColor: Colors.transparent,
    elevation: 0,
    foregroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll<Color>(kPrimaryColor),
    ),
  ),
  fontFamily: 'Roboto',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: kPrimaryColorWithOpacity10,
      backgroundColor: kPrimaryColor,
      elevation: 0,
      textStyle: kDefaultTextStyle,
      minimumSize: const Size.fromHeight(50),
      shape: const StadiumBorder(),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kInputFillColor,
    
    contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kInputBorderColor),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColorWithOpacity30),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
);
