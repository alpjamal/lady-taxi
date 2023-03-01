import 'package:flutter/material.dart';

import '/utils/constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({required this.onTap, super.key});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Image.asset(LTIconName.menu, cacheWidth: 17),
      ),
    );
  }
}
