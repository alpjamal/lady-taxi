import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/cubit/onboarding_page_cubit/onboarding_page_cubit.dart';
import '../registry_screen/registry_screen.dart';
import 'onboarding_page_widget.dart';
import '/../utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<OnboardingPageCubit>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => cubit.skip(),
                  child: const LocaleText("skip", style: LTTextStyle.defaultStyleRed),
                ),
              ],
            ),
            BlocListener<OnboardingPageCubit, OnboardingPageState>(
              listener: (_, state) {
                if (state is OnboardingLastPage) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const RegistryScreen()));
                }
              },
              child: SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: cubit.pageController,
                  itemCount: 3,
                  itemBuilder: (ctx, index) => OnboardingPage(index),
                  onPageChanged: (value) => cubit.changePage(value),
                ),
              ),
            ),
            const Spacer(),
            SmoothPageIndicator(
              controller: cubit.pageController,
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
                onPressed: () => cubit.next(),
                child: LocaleText(cubit.isLast ? 'start' : 'next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
