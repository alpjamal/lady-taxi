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
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(color: LadyTaxiColors.inputFill, shape: BoxShape.circle),
              child: Image.asset(
                'assets/icons/profile/human.png',
                alignment: Alignment.bottomCenter,
                color: LadyTaxiColors.inputBorder,
                cacheHeight: 75,
              ),
            ),
          ),
          Positioned(bottom: 3, right: 0, child: Image.asset('assets/icons/profile/write.png', cacheHeight: 24)),
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
        style: LadyTaxiTextStyles.defaultStyle,
        decoration: InputDecoration(hintText: hintText),
        enabled: enabled,
        onSaved: (newValue) {},
      ),
    );
  }
}
