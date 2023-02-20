import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../utils/variables.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/onboarding/vector$index.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset('assets/images/onboarding/onboardingimage$index.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: kOnboardingInfoTextStyle,
              children: infoSpanList[index - 1],
            ),
          ),
        ),
      ],
    );
  }
}
