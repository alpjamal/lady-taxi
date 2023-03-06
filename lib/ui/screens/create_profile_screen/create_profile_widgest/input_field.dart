import 'package:flutter/material.dart';

import '/utils/constants.dart';

class InputField extends StatelessWidget {
  const InputField(this.hintText, {this.enabled = true, super.key});
  final String hintText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        style: LTTextStyle.defaultStyle,
        decoration: InputDecoration(hintText: hintText),
        enabled: enabled,
        onSaved: (newValue) {},
      ),
    );
  }
}
