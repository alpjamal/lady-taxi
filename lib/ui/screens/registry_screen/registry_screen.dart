import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:otp_text_field/otp_text_field.dart';

import '/../data/BLoC/auth/auth_bloc.dart';
import '/utils/constants.dart';
import '../create_profile_screen/create_profile_screen.dart';
import '../home_screen/home_screen.dart';
import './registry_screen_widgets/registry_numpad.dart';
import './registry_screen_widgets/registry_confirm.dart';

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
  int _duration = LTDuration.message.inSeconds;
  String? _time;

  @override
  void initState() {
    super.initState();
    _textController.text = userInputNumber;
    _formatTime(_duration);
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText('signup'),
        leading: !onConfirmPage
            ? null
            : IconButton(
                onPressed: () {
                  onConfirmPage = false;
                  _repeat();
                  buttonDisabled = false;
                  _pageController.previousPage(duration: LTDuration.pageView, curve: Curves.fastOutSlowIn);
                },
                icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) => _eventHandle(context, state),
        child: SafeArea(
          child: Column(
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
                          RegistryNumberPage(_textController, buttonDisabled),
                          RegistryConfirmPage(
                              userInputNumber, _time!, buttonDisabled, _repeat, _otpController, userOtpInput),
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
                  color: LTColors.inputFill,
                  borderRadius: BorderRadius.only(topLeft: LTRadius.numpad, topRight: LTRadius.numpad),
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
                        child: LTVar.nums[index] == '.'
                            ? const Icon(Icons.backspace, size: 20)
                            : Text(LTVar.nums[index], style: LTTextStyle.numpad),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _eventHandle(BuildContext ctx, AuthState state) {
    if (state is GetOtpCodeSuccessState) {
      _startTimer();
      if (!onConfirmPage) {
        _pageController.nextPage(duration: LTDuration.pageView, curve: Curves.fastOutSlowIn);
        onConfirmPage = true;
      }
    } else if (state is VerifyOtpCodeSuccessState) {
      if (state.userInfo.isActive) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => CreateProfileScreen(userInputNumber)));
      }
    } else if (state is AuthErrorState) {
      _showErrorSnackbar('${state.error.response?.data['message']}');
    }
  }

  void _updateUserInput() {
    _textController.text = userInputNumber;
    _textController.selection = TextSelection.fromPosition(TextPosition(offset: userInputNumber.length));
    userInputNumber.length == 17 ? buttonDisabled = false : buttonDisabled = true;
    setState(() {});
  }

  void _startTimer() {
    setState(() => buttonDisabled = true);
    _timer != null ? _timer!.cancel() : null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration == 0) {
        setState(() => buttonDisabled = true);
        timer.cancel();
      } else {
        setState(() => _duration--);
      }
      _formatTime(_duration);
    });
  }

  _repeat() {
    buttonDisabled = true;
    userOtpInput = '';
    _otpController.clear();
    _duration = LTDuration.message.inSeconds;
  }

  _inkWellOnTap(int index) => onConfirmPage ? _inkWellOnConfirmPage(index) : _inkWellOnNumPage(index);

  _inkWellOnNumPage(int index) {
    var char = LTVar.nums[index];
    if (char == '.' && userInputNumber.length > 5) {
      var list = userInputNumber.split('');
      list.removeLast();
      userInputNumber = list.join();
      if (userInputNumber.length > 7) userInputNumber = userInputNumber.trimRight();
    } else if (char != '*' && char != '.' && userInputNumber.length < 17) {
      if (userInputNumber.length == 7 || userInputNumber.length == 11 || userInputNumber.length == 14) {
        userInputNumber += ' ';
      }
      userInputNumber += char;
    }
    _updateUserInput();
  }

  _inkWellOnConfirmPage(int index) {
    var char = LTVar.nums[index];
    int editIndex = userOtpInput.length;
    if (_duration > 0) {
      if (char == '.') {
        editIndex = userOtpInput.length - 1;
        if (editIndex >= 0) {
          FocusScope.of(context).previousFocus();
          _otpController.setValue('', editIndex);
          userOtpInput = userOtpInput.substring(0, userOtpInput.length - 1);
        }
      } else if (char != '*') {
        editIndex = userOtpInput.length;
        if (userOtpInput.length < 4) {
          FocusScope.of(context).nextFocus();
          _otpController.setValue(char, editIndex);
          userOtpInput += char;
        }
      }
    } else {
      _showErrorSnackbar('The time is out!');
    }
    userOtpInput.length == 4 ? buttonDisabled = false : buttonDisabled = true;
    setState(() {});
  }

  _formatTime(int duration) {
    _time = [Duration(seconds: duration).inMinutes, Duration(seconds: duration).inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(' : ');
  }

  _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message, style: LTTextStyle.hisPayBtnErr)));
  }
}
