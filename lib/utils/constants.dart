import 'package:flutter/material.dart';

class LTColors {
  static const primary = Color(0xFFFD0166);
  static const primaryWithOpacity10 = Color(0x1AFD0166);
  static const primaryWithOpacity30 = Color(0x4DFD0166);
  static const inputFill = Color(0xFFF0F0F0);
  static const inputBorder = Color(0xFFCCCCCC);
  static const dot = Color(0xFFFFB7D4);
  static const gray = Colors.grey;
  static const green = Colors.green;
}

class LTTextStyle {
  static const appbarStyle = TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600);
  static const defaultStyle = TextStyle(fontSize: 16, color: Colors.black);
  static const defaultStyleRed = TextStyle(fontSize: 16, color: LTColors.primary);
  static const defaultStyleRedBold = TextStyle(fontSize: 16, color: LTColors.primary, fontWeight: FontWeight.bold);
  static const onboardingInfo = TextStyle(fontSize: 20, color: Colors.black);
  static const onboardingInfoRed = TextStyle(fontSize: 20, color: LTColors.primary);
  static const numpad = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  static const hintText = TextStyle(fontSize: 24, color: LTColors.gray);
  static const repeatBtn =
      TextStyle(fontSize: 13, fontFamily: 'Poppins', color: Colors.blue, decoration: TextDecoration.underline);
  static const panelAddresSubtitle = TextStyle(fontSize: 12, fontFamily: 'Poppins');
  static const userContact = TextStyle(fontSize: 14, fontFamily: 'Poppins', color: Colors.white);
  static const panelAddresTitle = TextStyle(fontSize: 16, fontFamily: 'Poppins');
  static const panelAddresTitleBold = TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.bold);
  static const address =
      TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.black, fontWeight: FontWeight.bold);
  static const userName =
      TextStyle(fontSize: 20, fontFamily: 'Poppins', color: Colors.white, fontWeight: FontWeight.bold);
  static const hisPay = TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.bold);
  static const hisPayBtn = TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.green);
  static const hisPayBtnErr = TextStyle(fontSize: 16, fontFamily: 'Poppins', color: Colors.red);
}

class LTRadius {
  static const input = Radius.circular(12);
  static const numpad = Radius.circular(30);
  static const dialog = Radius.circular(30);
  static const profilePhoto = Radius.circular(50);
  static const menuButton = Radius.circular(8);
  static const bottomSheet = Radius.circular(30);
}

class LTDuration {
  static const message = Duration(seconds: 119);
  static const pageView = Duration(milliseconds: 300);
  static const alertDuration = Duration(seconds: 5);
  static const alertDelay = Duration(milliseconds: 20);
  static const panelOpen = Duration(milliseconds: 200);
}

class LTIconName {
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

class LTVar {
  static const nums = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '.'];
}

class LTPanelHeight {
  static const location = 160.0;
  static const userAdresses = 350.0;
  static const enterAddress = 550.0;
  static const addressInfo = 360.0;
}
