import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LadyTaxiBottomSheet extends StatelessWidget {
  const LadyTaxiBottomSheet({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.only(topLeft: LadyTaxiRadiuses.bottomSheet, topRight: LadyTaxiRadiuses.bottomSheet),
          ),
          child: Column(
            children: [
              Container(width: 70, height: 3, color: LadyTaxiColors.primaryColor),
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
