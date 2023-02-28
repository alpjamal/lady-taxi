import 'package:flutter/material.dart';

import '/utils/constants.dart';

class DashLine extends StatelessWidget {
  const DashLine({Key? key, this.height = 1, this.color = LadyTaxiColors.primary}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainHeight();
        const dashWidth = 4.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: List.generate(dashCount, (_) {
            return Container(width: dashHeight, height: dashWidth, color: color);
          }),
        );
      },
    );
  }
}
