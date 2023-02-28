import 'package:flutter/material.dart';

class LadyTaxiColors {
  static const primary = Color(0xFFFD0166);
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
  static const defaultStyleRed = TextStyle(color: LadyTaxiColors.primary, fontSize: 16);
  static const defaultStyleRedBold =
      TextStyle(color: LadyTaxiColors.primary, fontSize: 16, fontWeight: FontWeight.bold);
  static const onboardingInfo = TextStyle(fontSize: 20, color: Colors.black);
  static const onboardingInfoRed = TextStyle(fontSize: 20, color: LadyTaxiColors.primary);
  static const numpad = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const repeatBtn = TextStyle(
    fontSize: 13,
    color: Colors.blue,
    fontFamily: 'Poppins',
    decoration: TextDecoration.underline,
  );
  static const address = TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.black);
  static const hintText = TextStyle(fontSize: 24, color: LadyTaxiColors.gray);
  static const userName =
      TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.white, fontWeight: FontWeight.bold);
  static const userContact = TextStyle(fontSize: 14, fontFamily: 'Poppins', color: Colors.white);
  static const panelAddresTitle = TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.bold);
  static const panelAddresSubtitle = TextStyle(fontSize: 12, fontFamily: 'Poppins');
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
  static const alertBegin = Duration(milliseconds: 50);
  static const panelClose = Duration(milliseconds: 100);
  static const panelOpen = Duration(milliseconds: 200);
}

class LadyTaxiIconsName {
  static const getLocation = 'assets/icons/getlocation.png';
  static const congratulation = 'assets/icons/congratulations.png';
  static const point = 'assets/icons/point.png';
  static const menu = 'assets/icons/menu.png';
  static const writeRed = 'assets/icons/profile/write.png';
  static const writeWhite = 'assets/icons/writeWhite.png';
  static const avatar = 'assets/icons/profile/human.png';
  static const profile = 'assets/icons/drawer/profile.png';
  static const settings = 'assets/icons/drawer/settings.png';
  static const logout = 'assets/icons/drawer/logout.png';
  static const history = 'assets/icons/drawer/history.png';
}

class LadyTaxiVars {
  static const nums = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '.'];
}

class LadyTaxiPanelHeight {
  static const location = 160.0;
  static const userAdresses = 350.0;
  static const enterAddress = 550.0;
  static const addressInfo = 360.0;
}
