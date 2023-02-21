import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/onboarding_page_widget.dart';
import '/../utils/constants.dart';
import '/../utils/variables.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();

  bool islast = false;

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
                  onPressed: () {},
                  child: const Text('Skip', style: TextStyle(fontSize: 16, color: kPrimaryColor)),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _controller,
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  if (i + 2 == infoSpanList.length) {
                    islast = true;
                  }
                  return OnboardingPage(index: i + 1);
                },
              ),
            ),
            const Spacer(),
            SmoothPageIndicator(
              controller: _controller,
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
                  _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
                  setState(() {});
                },
                child: islast ? const Text('Start') : const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

