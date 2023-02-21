import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class RegistryNumberPage extends StatelessWidget {
  const RegistryNumberPage(this.textEditingController, {super.key});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ro'yxatdan o'tish uchun\n telefon raqamingizni kiriting!",
          textAlign: TextAlign.center,
          style: kDefaultTextStyle.copyWith(height: 1.8, fontFamily: 'Poppins'),
        ),
        const SizedBox(height: 60),
        Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
            child: Text('Telefon raqam', style: kDefaultTextStyle.copyWith(fontSize: 12)),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextField(
            keyboardType: TextInputType.none,
            controller: textEditingController,
            style: kDefaultTextStyle.copyWith(fontSize: 18, fontFamily: 'Inter'),
          ),
        ),
      ],
    );
  }
}
