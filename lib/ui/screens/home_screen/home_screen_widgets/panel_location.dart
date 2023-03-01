import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '/utils/constants.dart';
import './panel_blueprint.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel({required this.func, super.key});
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return LadyTaxiBottomSheet(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
          child: Row(
            children: [
              Image.asset(LTIconName.point, cacheWidth: 25),
              const SizedBox(width: 20),
              const Text('Chilonzor 9 dahasi 13', style: LTTextStyle.address),
            ],
          ),
        ),
        ElevatedButton(onPressed: func, child: const LocaleText('my_shipping_adress')),
      ],
    );
  }
}
