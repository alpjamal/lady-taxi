import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/data/Models/user_info.dart';
import 'package:lady_taxi/utils/constants.dart';

class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen(this.userInfo, {super.key});
  final UserInfoModel userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText('profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildField(userInfo.fullName, Icons.edit),
            _buildField(userInfo.phoneNumber, Icons.phone),
            _buildField('12/27/1998', Icons.calendar_month),
            _buildField('something@example.com', Icons.mail_outline),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const LocaleText('save'))
          ],
        ),
      ),
    );
  }

  _buildField(String hintText, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: LTTextStyle.defaultStyle,
          suffixIcon: Icon(icon),
        ),
      ),
    );
  }
}
