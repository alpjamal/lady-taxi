import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/utils/constants.dart';

class InputField extends StatelessWidget {
  const InputField(this.hintText, {this.enabled = true, super.key});
  final String hintText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String name = '';
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        style: LTTextStyle.defaultStyle,
        decoration: InputDecoration(hintText: hintText),
        enabled: enabled,
        onEditingComplete: () => _setName(name),
        onChanged: (value) => name = value,
      ),
    );
  }

  Future<void> _setName(String name) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(LtPrefs.name, name);
  }
}
