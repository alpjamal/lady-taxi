import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/data/BLoC/auth/auth_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '/utils/constants.dart';

class RegistryConfirmPage extends StatelessWidget {
  const RegistryConfirmPage(
    this.userNumber,
    this.time,
    this.buttonDisabled,
    this.otpController,
    this.userOtpInput, {
    super.key,
  });

  final String userNumber;
  final String time;
  final bool buttonDisabled;
  final OtpFieldController otpController;
  final String userOtpInput;

  @override
  Widget build(BuildContext context) {
    String userInputNumber = userNumber.replaceAll(' ', '').replaceAll('+', '');
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: LTTextStyle.defaultStyle.copyWith(height: 1.6, fontFamily: 'Poppins'),
                children: [
                  TextSpan(text: context.localeString('registryinfo1')),
                  if (Locales.lang == 'uz') TextSpan(text: userNumber, style: LTTextStyle.defaultStyleRedBold),
                  TextSpan(text: context.localeString('registryinfo2')),
                  if (Locales.lang != 'uz') TextSpan(text: userNumber, style: LTTextStyle.defaultStyleRedBold),
                  TextSpan(text: context.localeString('registryinfo3')),
                  TextSpan(text: time, style: LTTextStyle.defaultStyleRedBold),
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
            if (time == '00 : 00')
              TextButton(
                onPressed: () => context.read<AuthBloc>().add(GetOtpCodeEvent(userInputNumber)),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: LocaleText('registryrepeat', style: LTTextStyle.repeatBtn),
                ),
              ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: ElevatedButton(
                onPressed: buttonDisabled
                    ? null
                    : () => context.read<AuthBloc>().add(ConfirmOtpEvent(userInputNumber, userOtpInput)),
                child: state is AuthLoadingState && !buttonDisabled
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const LocaleText('continue'),
              ),
            ),
          ],
        );
      },
    );
  }
}
