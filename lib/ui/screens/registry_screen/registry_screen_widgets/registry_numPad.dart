import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/data/BLoC/auth/auth_bloc.dart';

import '/utils/constants.dart';

class RegistryNumberPage extends StatelessWidget {
  const RegistryNumberPage(this.textEditingController, this.buttonDisabled, {super.key});
  final TextEditingController textEditingController;
  final bool buttonDisabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocaleText(
          'enteranumber',
          textAlign: TextAlign.center,
          style: LTTextStyle.defaultStyle.copyWith(height: 1.8, fontFamily: 'Poppins'),
        ),
        const SizedBox(height: 60),
        Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 0, 0, 5),
            child: LocaleText('phoneinputlabel', style: LTTextStyle.defaultStyle.copyWith(fontSize: 12)),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            keyboardType: TextInputType.none,
            controller: textEditingController,
            style: LTTextStyle.defaultStyle.copyWith(fontSize: 18, fontFamily: 'Inter'),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ElevatedButton(
            onPressed: buttonDisabled
                ? null
                : () {
                    var userInputNumber = textEditingController.text.replaceAll(' ', '').replaceAll('+', '');
                    context.read<AuthBloc>().add(GetOtpCodeEvent(userInputNumber));
                  },
            child: const LocaleText('continue'),
          ),
        ),
      ],
    );
  }
}
