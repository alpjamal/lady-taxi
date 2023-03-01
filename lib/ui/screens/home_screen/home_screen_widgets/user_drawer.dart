import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/ui/screens/history_screen.dart';

import '/utils/constants.dart';
import '../../setting_screen.dart';
import '../../profile_data_screen.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer(this.logout, {super.key});
  final Function() logout;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _header(),
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

  _header() {
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
                  const Text('Madina Aliyeva', style: LTTextStyle.userName),
                  const SizedBox(height: 5),
                  const Text('+998 91 123 45 67', style: LTTextStyle.userContact),
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
