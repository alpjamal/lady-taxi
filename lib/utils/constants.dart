import 'package:flutter/material.dart';

class LadyTaxiColors {
  static const primaryColor = Color(0xFFFD0166);
  static const primaryWithOpacity10 = Color(0x1AFD0166);
  static const primaryWithOpacity30 = Color(0x4DFD0166);
  static const inputFill = Color(0xFFF0F0F0);
  static const inputBorder = Color(0xFFCCCCCC);
  static const dot = Color(0xFFFFB7D4);
  static const gray = Colors.grey;
}

class LadyTaxiTextStyles {
  static const appbarStyle = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);
  static const defaultStyle = TextStyle(color: Colors.black, fontSize: 16);
  static const defaultStyleRed = TextStyle(color: LadyTaxiColors.primaryColor, fontSize: 16);
  static const defaultStyleRedBold = TextStyle(color: LadyTaxiColors.primaryColor, fontSize: 16);
  static const onboardingInfo = TextStyle(fontSize: 20, color: Colors.black);
  static const onboardingInfoRed = TextStyle(fontSize: 20, color: LadyTaxiColors.primaryColor);
  static const numpad = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const repeatBtn = TextStyle(
    fontSize: 13,
    color: Colors.blue,
    fontFamily: 'Poppins',
    decoration: TextDecoration.underline,
  );
  static const address = TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold);
  static const hintText = TextStyle(fontSize: 24, color: LadyTaxiColors.gray);
}

class LadyTaxiRadiuses {
  static const input = Radius.circular(12);
  static const numpad = Radius.circular(30);
  static const dialog = Radius.circular(30);
  static const profilePhoto = Radius.circular(50);
  static const menuButton = Radius.circular(8);
  static const bottomSheet = Radius.circular(30);
}

class LadyTaxiDurations {
  static const message = Duration(seconds: 119);
  static const pageView = Duration(milliseconds: 300);
  static const alert = Duration(seconds: 5);
  static const panelClose = Duration(milliseconds: 100);
  static const panelOpen = Duration(milliseconds: 400);
}

class LadyTaxiIconsName {
  static const getLocation = 'assets/icons/getlocation.png';
  static const congratulation = 'assets/icons/congratulations.png';
  static const point = 'assets/icons/point.png';
  static const menu = 'assets/icons/menu.png';
  static const write = 'assets/icons/profile/write.png';
  static const avatar = 'assets/icons/profile/human.png';
}

class LadyTaxiVars {
  static const nums = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '.'];
}

class LadyTaxiPanelHeight {
  static const little = 160.0;
  static const large = 400.0;
}