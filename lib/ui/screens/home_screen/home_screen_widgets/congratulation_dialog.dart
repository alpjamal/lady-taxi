import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '/../utils/constants.dart';

class CongratulationDialog extends StatelessWidget {
  const CongratulationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: SimpleDialog(
        title: Image.asset(LadyTaxiIconsName.congratulation),
        titlePadding: const EdgeInsets.fromLTRB(70, 70, 70, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(LadyTaxiRadiuses.dialog),
        ),
        children: [
          const LocaleText(
            'congratulations',
            style: LadyTaxiTextStyles.appbarStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          LocaleText(
            'you_have_successfully_registered',
            style: LadyTaxiTextStyles.defaultStyle.copyWith(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
