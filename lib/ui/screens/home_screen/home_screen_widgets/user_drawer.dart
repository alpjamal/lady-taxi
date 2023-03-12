import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/ui/screens/history_screen.dart';

import '../../../../data/Models/user_info.dart';
import '/utils/constants.dart';
import '../../setting_screen.dart';
import '../../profile_data_screen.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer(this.userInfo, this.logout, {super.key});
  final UserInfoModel userInfo;
  final Function() logout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _userInfoHeader(context, userInfo),
          _listTile('profile', Icons.account_circle, () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const ProfileDataScreen()));
          }),
          _listTile('history', Icons.history, () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const HistoryScreen()));
          }),
          _listTile('settings', Icons.settings, () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const SettingsScreen()));
          }),
          _listTile('logout', Icons.logout, logout),
        ],
      ),
    );
  }

  _userInfoHeader(ctx, UserInfoModel userInfo) {
    String name = userInfo.fullName;
    String phoneNum = _format(userInfo.phoneNumber);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 275,
        color: LTColors.primary,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Stack(
                      children: [
                        ClipOval(
                            child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover, width: 95, height: 95)),
                        Positioned(bottom: 3, right: 0, child: Image.asset(LTIconName.writeWhite, cacheHeight: 24)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(name, style: LTTextStyle.userName),
                  const SizedBox(height: 5),
                  Text(phoneNum, style: LTTextStyle.userContact),
                ],
              ),
            ),
            Image.asset('assets/images/drawer/oval0.png', fit: BoxFit.fitHeight),
            Image.asset('assets/images/drawer/oval1.png'),
          ],
        ),
      ),
    );
  }

  _format(String number) {
    number.split('').insert(3, '');
    var list = number.split('');
    list.insert(3, ' ');
    list.insert(6, ' ');
    list.insert(10, ' ');
    list.insert(13, ' ');
    number = '+${list.join()}';
    return number;
  }

  _listTile(String title, IconData icon, Function() func) {
    return ListTile(
      title: LocaleText(title, style: LTTextStyle.defaultStyle),
      leading: Icon(icon, size: 30, color: LTColors.gray),
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      horizontalTitleGap: 0,
      onTap: func,
    );
  }
}
