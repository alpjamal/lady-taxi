import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:http/http.dart' as http;

import '/utils/constants.dart';
import '../create_profile_screen/create_profile_screen.dart';
import '../home_screen/home_screen.dart';
import './registry_screen_widgets/registry_numPad.dart';
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
      appBar: AppBar(title: const LocaleText('signup')),
      body: SafeArea(
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
    );
  }

  _formatTime(int duration) {
    _time = [Duration(seconds: duration).inMinutes, Duration(seconds: duration).inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
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

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration == 1 && userOtpInput.length == 4) {
        _duration--;
        setState(() => buttonDisabled = false);
        _formatTime(_duration);
      } else if (_duration == 0) {
        timer.cancel();
      } else {
        if (userOtpInput.length == 4) {
          buttonDisabled = false;
        } else {
          buttonDisabled = true;
        }
        setState(() => _duration--);
        _formatTime(_duration);
      }
    });
  }

  _goToConfirm() async {
    userInputNumber = userInputNumber.replaceAll(' ', '').replaceAll('+', '');
    Uri loginUrl = Uri.parse('http://3.75.239.91:9000/v1/user/login/$userInputNumber');
    final response = await http.post(loginUrl);
    final result = json.decode(response.body);

    if (!onConfirmPage) {
      if (response.statusCode == 200) {
        setState(() => buttonDisabled = true);
        _pageController.nextPage(duration: LTDuration.pageView, curve: Curves.fastOutSlowIn);
        _startTimer();
        onConfirmPage = true;
      } else {
        if (true) {}
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['message'], style: const TextStyle(color: Colors.red))),
        );
      }
    }
  }

  _confirm() async {
    final verifyUrl = Uri.parse('http://3.75.239.91:9000/v1/user/verify/$userInputNumber/$userOtpInput');
    final response = await http.get(verifyUrl);
    final result = json.decode(response.body);
    if (response.statusCode == 200) {
      if (result['id'].length > 1) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
      } else if (result['access_token'] != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => CreateProfileScreen(userInputNumber)));
      }
    } else if (response.statusCode == 409) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong confirmation code!', style: TextStyle(color: Colors.red))),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Oops, an error has occured!', style: TextStyle(color: Colors.red))),
      );
    }
  }

  _repeat() {
    userOtpInput = '';
    _otpController.clear();
    _timer!.cancel();
    _duration = LTDuration.message.inSeconds;
    _formatTime(_duration);
    setState(() => buttonDisabled = true);
    _startTimer();
    _goToConfirm();
  }

  _inkWellOnTap(int index) => onConfirmPage ? _inkWellOnConfirmPage(index) : _inkWellOnNumPage(index);

  _inkWellOnNumPage(int index) {
    if (LTVar.nums[index] == '.' && userInputNumber.length > 5) {
      var list = userInputNumber.split('');
      list.removeLast();
      userInputNumber = list.join();
      if (userInputNumber.length > 7) {
        userInputNumber = userInputNumber.trimRight();
      }
      _updateUserInput();
    } else if (LTVar.nums[index] != '*' && LTVar.nums[index] != '.' && userInputNumber.length < 17) {
      if (userInputNumber.length == 7 || userInputNumber.length == 11 || userInputNumber.length == 14) {
        userInputNumber += ' ';
      }
      userInputNumber += LTVar.nums[index];
      _updateUserInput();
    }
  }

  _inkWellOnConfirmPage(int index) {
    int editIndex = userOtpInput.length;
    if (LTVar.nums[index] == '.') {
      editIndex = userOtpInput.length - 1;
      if (editIndex >= 0) {
        FocusScope.of(context).previousFocus();
        _otpController.setValue('', editIndex);
        userOtpInput = userOtpInput.substring(0, userOtpInput.length - 1);
      }
    } else if (LTVar.nums[index] != '*' && LTVar.nums[index] != '.') {
      editIndex = userOtpInput.length;
      if (userOtpInput.length < 4) {
        FocusScope.of(context).nextFocus();
        _otpController.setValue(LTVar.nums[index], editIndex);
        userOtpInput += LTVar.nums[index];
      }
    }
  }
}
