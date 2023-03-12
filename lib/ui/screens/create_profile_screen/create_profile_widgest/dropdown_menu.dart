import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/utils/constants.dart';

class GenderDropDown extends StatefulWidget {
  const GenderDropDown({super.key});

  @override
  State<GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<GenderDropDown> {
  String _selectedGender = 'ayol';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.only(right: 10, left: 20),
      decoration: const BoxDecoration(color: LTColors.inputFill, borderRadius: BorderRadius.all(LTRadius.input)),
      child: DropdownButton(
        underline: const SizedBox(),
        style: LTTextStyle.defaultStyle,
        value: _selectedGender,
        onChanged: (value) => _setGender(value ?? _selectedGender),
        isExpanded: true,
        items: const [
          DropdownMenuItem(value: 'ayol', child: LocaleText('female')),
          DropdownMenuItem(value: 'erkak', child: LocaleText('male')),
        ],
      ),
    );
  }

  Future<void> _setGender(String gender) async {
    _selectedGender = gender;
    setState(() {});
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(LtPrefs.gender, gender);
  }
}
