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
            _settingCard(
              title: 'notifications',
              child: Container(
                color: Colors.amber,
                padding: EdgeInsets.zero,
                child: Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: LTColors.primary,
                  value: _notification,
                  onChanged: (value) => setState(() => _notification = value),
                ),
              ),
            ),
            _settingCard(title: 'security', child: const Icon(Icons.arrow_forward_ios)),
            _settingCard(title: 'language', child: const Icon(Icons.arrow_forward_ios)),
            _settingCard(
              title: 'night_mode',
              child: Switch(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: LTColors.primary,
                value: _darkMode,
                onChanged: (value) => setState(() => _darkMode = value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingCard({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: const BoxDecoration(color: LTColors.inputFill, borderRadius: BorderRadius.all(LTRadius.input)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocaleText(title, style: LTTextStyle.defaultStyle),
          child,
        ],
      ),
    );
  }
}
