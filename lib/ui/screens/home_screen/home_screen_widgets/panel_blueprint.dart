import 'package:flutter/material.dart';

import '/utils/constants.dart';

class LadyTaxiBottomSheet extends StatelessWidget {
  const LadyTaxiBottomSheet({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: LTRadius.bottomSheet, topRight: LTRadius.bottomSheet),
          ),
          child: Column(
            children: [
              Container(width: 80, height: 3, color: LTColors.primary),
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
