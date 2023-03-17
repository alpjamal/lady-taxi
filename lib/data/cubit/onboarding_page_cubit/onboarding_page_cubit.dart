import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/utils/constants.dart';

part 'onboarding_page_state.dart';

class OnboardingPageCubit extends Cubit<OnboardingPageState> {
  OnboardingPageCubit() : super(OnboardingPageInitial());

  final _pageController = PageController();
  bool _isLast = false;

  PageController get pageController => _pageController;
  bool get isLast => _isLast;

  next() {
    if (!_isLast) _pageController.nextPage(duration: LTDuration.pageView, curve: Curves.fastOutSlowIn);
    if (_isLast) skip();
  }

  skip() async {
    _isLast = true;
    emit(OnboardingLastPage());
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(LtPrefs.isInitial, false);
  }

  changePage(int value) {
    if (value == 2) _isLast = true;
    if (value == 1) _isLast = false;
  }
}
