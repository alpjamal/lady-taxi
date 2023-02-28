import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '/utils/constants.dart';
import './panel_blueprint.dart';

class UserAddressesPanel extends StatelessWidget {
  const UserAddressesPanel({required this.func, super.key});
  final Function() func;

  _buildUserAddresses() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 60,
        decoration:
            BoxDecoration(border: Border.all(color: LadyTaxiColors.primary), borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [Text('16 km'), Text('■'), Text('Uyim')],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LadyTaxiBottomSheet(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(text: context.localeString('hello'), style: LadyTaxiTextStyles.address),
              TextSpan(text: 'Madina!', style: LadyTaxiTextStyles.address.copyWith(color: LadyTaxiColors.primary)),
            ]),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: context.localeString('where_to_go'),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('| ', style: LadyTaxiTextStyles.hintText),
                IconButton(onPressed: func, icon: const Icon(Icons.search)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _buildUserAddresses(),
          ),
        ),
      ],
    );
  }
}
