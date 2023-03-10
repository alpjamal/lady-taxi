import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '/utils/constants.dart';
import './panel_blueprint.dart';
import '../../../widgets/dash_line.dart';

class AddressInfoPanel extends StatelessWidget {
  const AddressInfoPanel({required this.func, super.key});
  final Function() func;

  Divider _buildDivider() => const Divider(indent: 0, endIndent: 0, thickness: 1);

  @override
  Widget build(BuildContext context) {
    var trailingIcon = Image.asset('assets/icons/pencil.png', cacheHeight: 20, color: LTColors.primary);
    return LadyTaxiBottomSheet(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LocaleText('distance', style: LTTextStyle.panelAddresTitleBold),
              Text('6.5 km', style: LTTextStyle.panelAddresSubtitle),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                ListTile(
                  leading:
                      const SizedBox(height: double.infinity, child: Icon(Icons.adjust, size: 30, color: Colors.green)),
                  style: ListTileStyle.drawer,
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Chilonzor dahasi 13', style: LTTextStyle.panelAddresTitleBold),
                  subtitle: Text('Qatortol, Rahyon19', style: LTTextStyle.panelAddresSubtitle.copyWith(height: 2)),
                  trailing: trailingIcon,
                ),
                ListTile(
                  leading: const SizedBox(
                      height: double.infinity,
                      child: Icon(Icons.location_on_rounded, size: 30, color: LTColors.primary)),
                  style: ListTileStyle.drawer,
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Chilonzor dahasi 13', style: LTTextStyle.panelAddresTitleBold),
                  subtitle: Text('Qatortol, Rahyon19', style: LTTextStyle.panelAddresSubtitle.copyWith(height: 2)),
                  trailing: trailingIcon,
                ),
              ],
            ),
            const Positioned(left: 14, child: SizedBox(height: 35, child: DashLine(height: 3))),
          ],
        ),
        _buildDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LocaleText('payment', style: LTTextStyle.panelAddresTitleBold),
              Text('14 000 sum', style: LTTextStyle.panelAddresTitleBold.copyWith(color: LTColors.primary)),
            ],
          ),
        ),
        ElevatedButton(onPressed: func, child: const LocaleText('my_shipping_adress')),
      ],
    );
  }
}
