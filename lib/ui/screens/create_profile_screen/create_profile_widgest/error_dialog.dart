import 'dart:ui';
import 'package:flutter/material.dart';
import '/../utils/constants.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: SimpleDialog(
        elevation: 0,
        title: Text(message, style: LTTextStyle.snackErr),
        backgroundColor: LTColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(LTRadius.snackBar),
        ),
        titlePadding: const EdgeInsets.all(30),
      ),
    );
  }
}
