import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/utils/constants.dart';

class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen({super.key});

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
            _buildField('Madina Aliyeva', Icons.edit),
            _buildField('+998 91 123 45 67', Icons.phone),
            _buildField('12/27/1998', Icons.calendar_month),
            _buildField('madina@example.com', Icons.mail_outline),
            ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const LocaleText('save'))
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
