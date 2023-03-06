import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '/utils/constants.dart';

class RegistryNumberPage extends StatelessWidget {
  const RegistryNumberPage(this.textEditingController, this.buttonDisabled, this.myFunc, {super.key});
  final TextEditingController textEditingController;
  final bool buttonDisabled;
  final Function() myFunc;

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
            onPressed: buttonDisabled ? null : myFunc,
            child: const LocaleText('continue'),
          ),
        ),
      ],
    );
  }
}
