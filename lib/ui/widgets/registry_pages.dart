import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../utils/constants.dart';

class RegistryNumberPage extends StatelessWidget {
  const RegistryNumberPage(this.textEditingController, this.buttonDisabled, this.myFunc, {super.key});
  final TextEditingController textEditingController;
  final bool buttonDisabled;
  final Function() myFunc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ro'yxatdan o'tish uchun\n telefon raqamingizni kiriting!",
          textAlign: TextAlign.center,
          style: LadyTaxiTextStyles.defaultStyle.copyWith(height: 1.8, fontFamily: 'Poppins'),
        ),
        const SizedBox(height: 60),
        Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 0, 5),
            child: Text('Telefon raqam', style: LadyTaxiTextStyles.defaultStyle.copyWith(fontSize: 12)),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            keyboardType: TextInputType.none,
            controller: textEditingController,
            style: LadyTaxiTextStyles.defaultStyle.copyWith(fontSize: 18, fontFamily: 'Inter'),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ElevatedButton(
            onPressed: buttonDisabled ? null : myFunc,
            child: const Text('Continue'),
          ),
        ),
      ],
    );
  }
}

class RegistryConfirmPage extends StatelessWidget {
  const RegistryConfirmPage(
    this.userNumber,
    this.time,
    this.buttonDisabled,
    this.myFunc,
    this.repeat,
    this.otpController, {
    super.key,
  });

  final String userNumber;
  final String time;
  final bool buttonDisabled;
  final Function() myFunc;
  final Function() repeat;
  final OtpFieldController otpController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: LadyTaxiTextStyles.defaultStyle.copyWith(height: 1.6, fontFamily: 'Poppins'),
            children: [
              const TextSpan(text: 'Tasdiqlash kodi '),
              TextSpan(text: userNumber, style: LadyTaxiTextStyles.defaultStyleRedBold),
              const TextSpan(text: '\nraqamiga yuborildi.'),
              const TextSpan(text: '\nQabul qilish vaqti:\n'),
              TextSpan(text: time, style: LadyTaxiTextStyles.defaultStyleRedBold),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
          child: OTPTextField(
            controller: otpController,
            keyboardType: TextInputType.none,
            length: 4,
            width: MediaQuery.of(context).size.width,
            textFieldAlignment: MainAxisAlignment.spaceBetween,
            fieldStyle: FieldStyle.box,
            fieldWidth: MediaQuery.of(context).size.width / 4 - 24,
            outlineBorderRadius: 12,
          ),
        ),
        TextButton(
          onPressed: repeat,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text('Kod qayta yurborilsin', style: LadyTaxiTextStyles.repeatBtn),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ElevatedButton(
            onPressed: buttonDisabled ? null : myFunc,
            child: const Text('Continue'),
          ),
        ),
      ],
    );
  }
}
