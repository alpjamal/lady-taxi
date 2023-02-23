import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:otp_text_field/otp_text_field.dart';

import 'create_profile_screen.dart';
import '/utils/constants.dart';
import '../widgets/registry_pages.dart';

class RegistryScreen extends StatefulWidget {
  const RegistryScreen({super.key});

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  final TextEditingController _textController = TextEditingController();
  final _pageController = PageController();
  final OtpFieldController _otpController = OtpFieldController();

  String userInputNumber = '+998 ';
  String userOtpInput = '';
  bool buttonDisabled = true;
  bool onConfirmPage = false;

  Timer? _timer;
  int _duration = LadyTaxiVars.duration;
  String? _time;

  formatTime(int duration) {
    _time = [Duration(seconds: duration).inMinutes, Duration(seconds: duration).inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  @override
  void initState() {
    super.initState();
    _textController.text = userInputNumber;
    formatTime(_duration);
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  void _updateUserInput() {
    _textController.text = userInputNumber;
    _textController.selection = TextSelection.fromPosition(TextPosition(offset: userInputNumber.length));
    if ((userInputNumber.startsWith('+998 9') ||
            userInputNumber.startsWith('+998 3') ||
            userInputNumber.startsWith('+998 7')) &&
        userInputNumber.length == 17) {
      setState(() => buttonDisabled = false);
    } else if (buttonDisabled == false) {
      setState(() => buttonDisabled = true);
    }
  }

  _goToConfirm() {
    setState(() => buttonDisabled = true);
    _pageController.nextPage(duration: LadyTaxiDurations.pageView, curve: Curves.fastOutSlowIn);
    startTimer();
    onConfirmPage = true;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration == 1 && userOtpInput.length == 4) {
        _duration--;
        setState(() => buttonDisabled = false);
        formatTime(_duration);
      } else if (_duration == 0) {
        timer.cancel();
      } else {
        if (userOtpInput.length == 4) {
          buttonDisabled = false;
        } else {
          buttonDisabled = true;
        }
        setState(() => _duration--);
        formatTime(_duration);
      }
    });
  }

  _confirm() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen(userInputNumber)));
  }

  _repeat() {
    userOtpInput = '';
    _otpController.clear();
    _timer!.cancel();
    _duration = LadyTaxiVars.duration;
    formatTime(_duration);
    setState(() => buttonDisabled = true);
    startTimer();
  }

  _inkWellOnTap(int index) {
    if (onConfirmPage) {
      _inkWellOnConfirmPage(index);
    } else {
      _inkWellOnNumPage(index);
    }
  }

  _inkWellOnNumPage(int index) {
    if (LadyTaxiVars.nums[index] == '.' && userInputNumber.length > 5) {
      var list = userInputNumber.split('');
      list.removeLast();
      userInputNumber = list.join();
      if (userInputNumber.length > 7) {
        userInputNumber = userInputNumber.trimRight();
      }
      _updateUserInput();
    } else if (LadyTaxiVars.nums[index] != '*' && LadyTaxiVars.nums[index] != '.' && userInputNumber.length < 17) {
      if (userInputNumber.length == 7 || userInputNumber.length == 11 || userInputNumber.length == 14) {
        userInputNumber += ' ';
      }
      userInputNumber += LadyTaxiVars.nums[index];
      _updateUserInput();
    }
  }

  _inkWellOnConfirmPage(int index) {
    int editIndex = userOtpInput.length;
    if (LadyTaxiVars.nums[index] == '.') {
      editIndex = userOtpInput.length - 1;
      if (editIndex >= 0) {
        FocusScope.of(context).previousFocus();
        _otpController.setValue('', editIndex);
        userOtpInput = userOtpInput.substring(0, userOtpInput.length - 1);
      }
    } else if (LadyTaxiVars.nums[index] != '*' && LadyTaxiVars.nums[index] != '.') {
      editIndex = userOtpInput.length;
      if (userOtpInput.length < 4) {
        FocusScope.of(context).nextFocus();
        _otpController.setValue(LadyTaxiVars.nums[index], editIndex);
        userOtpInput += LadyTaxiVars.nums[index];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const LocaleText('signup')),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      allowImplicitScrolling: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        RegistryNumberPage(_textController, buttonDisabled, _goToConfirm),
                        RegistryConfirmPage(userInputNumber, _time!, buttonDisabled, _confirm, _repeat, _otpController),
                      ],
                      onPageChanged: (value) => value == 1 ? _otpController.setFocus(0) : null,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 264,
              decoration: const BoxDecoration(
                color: LadyTaxiColors.inputFill,
                borderRadius: BorderRadius.only(topLeft: LadyTaxiRadiuses.numpad, topRight: LadyTaxiRadiuses.numpad),
              ),
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 264 / 4,
                ),
                physics: const ScrollPhysics(),
                itemCount: 12,
                padding: const EdgeInsets.all(0),
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () => _inkWellOnTap(index),
                    child: Center(
                      child: LadyTaxiVars.nums[index] == '.'
                          ? const Icon(Icons.backspace, size: 20)
                          : Text(LadyTaxiVars.nums[index], style: LadyTaxiTextStyles.numpad),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
