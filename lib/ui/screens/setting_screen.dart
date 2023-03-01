import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/utils/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText('settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildField(
                'notifications',
                Switch(
                    activeColor: LTColors.primary,
                    value: _notification,
                    onChanged: (value) => setState(() => _notification = value))),
            _buildField('security', const Icon(Icons.arrow_forward_ios)),
            _buildField('language', const Icon(Icons.arrow_forward_ios)),
            _buildField(
                'night_mode',
                Switch(
                    activeColor: LTColors.primary,
                    value: _darkMode,
                    onChanged: (value) => setState(() => _darkMode = value))),
          ],
        ),
      ),
    );
  }

  _buildField(String hintText, Widget item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: context.localeString(hintText),
          hintStyle: LTTextStyle.defaultStyle,
          suffixIcon: item,
        ),
      ),
    );
  }
}
