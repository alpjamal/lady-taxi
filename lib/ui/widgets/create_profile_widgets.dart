import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(LTRadius.profilePhoto),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(color: LTColors.inputFill, shape: BoxShape.circle),
              child: Image.asset(
                LTIconName.avatar,
                alignment: Alignment.bottomCenter,
                color: LTColors.inputBorder,
                cacheHeight: 75,
              ),
            ),
          ),
          Positioned(bottom: 3, right: 0, child: Image.asset(LTIconName.writeRed, cacheHeight: 24)),
        ],
      ),
    );
  }
}

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
