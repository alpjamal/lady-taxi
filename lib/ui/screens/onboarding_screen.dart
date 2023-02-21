import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'registry_screen.dart';
import '../widgets/onboarding_page_widget.dart';
import '/../utils/constants.dart';
import '/../utils/variables.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  bool islast = false;
  String buttonLabel = 'Next';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const RegistryScreen()));
                  },
                  child: Text('Skip', style: kDefaultTextStyle.copyWith(color: kPrimaryColor)),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                allowImplicitScrolling: false,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  if (i + 2 == infoSpanList.length) islast = true;
                  return OnboardingPage(index: i + 1);
                },
              ),
            ),
            const Spacer(),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: kPrimaryColor,
                dotColor: Color(0xFFFFB7D4),
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
              child: ElevatedButton(
                onPressed: () {
                  if (buttonLabel == 'Start') {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const RegistryScreen()));
                  } else if (islast) {
                    setState(() => buttonLabel = 'Start');
                  }
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
                },
                child: Text(buttonLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
