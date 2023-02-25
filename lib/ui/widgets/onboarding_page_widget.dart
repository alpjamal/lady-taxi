import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../utils/constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 380,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/onboarding/vector$index.png')),
          ),
          child: Image.asset('assets/images/onboarding/onboardingimage$index.png'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
          child: LocaleText('info$index', textAlign: TextAlign.center, style: LadyTaxiTextStyles.onboardingInfo),
        ),
      ],
    );
  }
}
