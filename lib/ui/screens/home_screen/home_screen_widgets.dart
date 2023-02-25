import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

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
            borderRadius:
                BorderRadius.only(topLeft: LadyTaxiRadiuses.bottomSheet, topRight: LadyTaxiRadiuses.bottomSheet),
          ),
          child: Column(
            children: [
              Container(width: 80, height: 3, color: LadyTaxiColors.primaryColor),
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}

class UserAdresses extends StatelessWidget {
  const UserAdresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        decoration: BoxDecoration(
            border: Border.all(color: LadyTaxiColors.primaryColor), borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [Text('16 km'), Text('■'), Text('Uyim')],
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Image.asset(LadyTaxiIconsName.menu, cacheWidth: 17),
    );
  }
}

class CongratulationDialog extends StatelessWidget {
  const CongratulationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: SimpleDialog(
        title: Image.asset(LadyTaxiIconsName.congratulation),
        titlePadding: const EdgeInsets.fromLTRB(70, 70, 70, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(LadyTaxiRadiuses.dialog),
        ),
        children: [
          const LocaleText(
            'congratulations',
            style: LadyTaxiTextStyles.appbarStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          LocaleText(
            'you_have_successfully_registered',
            style: LadyTaxiTextStyles.defaultStyle.copyWith(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

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
              Image.asset(LadyTaxiIconsName.point, cacheWidth: 25),
              const SizedBox(width: 20),
              const Text('Chilonzor 9 dahasi 13', style: LadyTaxiTextStyles.address),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: func,
          child: const LocaleText('my_shipping_adress'),
        ),
      ],
    );
  }
}

class UserAddressPanel extends StatelessWidget {
  const UserAddressPanel({required this.func, super.key});
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return LadyTaxiBottomSheet(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text('Salom Madina!', style: LadyTaxiTextStyles.address, textAlign: TextAlign.center),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Qayerga boramiz?',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [Text('| ', style: LadyTaxiTextStyles.hintText), Icon(Icons.search)],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const UserAdresses(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: func,
          child: const LocaleText('my_shipping_adress'),
        ),
      ],
    );
  }
}
