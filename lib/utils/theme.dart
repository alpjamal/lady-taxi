import 'package:flutter/material.dart';
import './constants.dart';

final kthemeData = ThemeData(
  primaryColor: kPrimaryColor,
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStatePropertyAll<Color>(kPrimaryColor),
    ),
  ),
  fontFamily: 'Roboto',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kPrimaryColor,
      textStyle: const TextStyle(fontSize: 16),
      minimumSize: const Size.fromHeight(50),
      shape: const StadiumBorder(),
    ),
  ),
);
