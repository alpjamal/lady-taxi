import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import './registry_screen/registry_screen.dart';
import '../widgets/onboarding_page_widget.dart';
import '/../utils/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  bool isLast = false;

  _btnHandle() {
    isLast
        ? Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const RegistryScreen()))
        : _pageController.nextPage(duration: LTDuration.pageView, curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    isLast = true;
                    _btnHandle();
                  },
                  child: const LocaleText("skip", style: LTTextStyle.defaultStyleRed),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (ctx, index) => OnboardingPage(index),
                onPageChanged: (value) {
                  if (value == 2) {
                    setState(() => isLast = true);
                  } else if (value == 1) {
                    setState(() => isLast = false);
                  }
                },
              ),
            ),
            const Spacer(),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                activeDotColor: LTColors.primary,
                dotColor: LTColors.dot,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
              child: ElevatedButton(
                onPressed: _btnHandle,
                child: LocaleText(isLast ? 'start' : 'next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
