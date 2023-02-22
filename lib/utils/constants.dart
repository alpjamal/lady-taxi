import 'package:flutter/material.dart';

class LadyTaxiColors {
  static const primaryColor = Color(0xFFFD0166);
  static const primaryWithOpacity10 = Color(0x1AFD0166);
  static const primaryWithOpacity30 = Color(0x4DFD0166);
  static const inputFill = Color(0xFFF0F0F0);
  static const inputBorder = Color(0xFFCCCCCC);
  static const dot = Color(0xFFFFB7D4);
}

class LadyTaxiTextStyles {
  static const defaultStyle = TextStyle(color: Colors.black, fontSize: 16);
  static const defaultStyleRed = TextStyle(color: LadyTaxiColors.primaryColor, fontSize: 16);
  static const defaultStyleRedBold = TextStyle(color: LadyTaxiColors.primaryColor, fontSize: 16);
  static const onboardingInfo = TextStyle(fontSize: 20, color: Colors.black);
  static const onboardingInfoRed = TextStyle(fontSize: 20, color: LadyTaxiColors.primaryColor);
  static const numpad = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const repeatBtn =
      TextStyle(fontSize: 13, color: Colors.blue, fontFamily: 'Poppins', decoration: TextDecoration.underline);
}

class LadyTaxiRadiuses {
  static const input = Radius.circular(12);
  static const numpad = Radius.circular(30);
}

class LadyTaxiVars {
  static const nums = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '.'];
  static const duration = 119;
}

class LadyTaxiDurations {
  static const pageView = Duration(milliseconds: 300);
}
