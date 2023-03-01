import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../widgets/dash_line.dart';
import '/utils/constants.dart';
import './panel_blueprint.dart';

class AddressEnteringPanel extends StatelessWidget {
  const AddressEnteringPanel({required this.func, required this.controller, super.key});
  final Function() func;
  final ScrollController controller;

  Divider _buildDivider() => const Divider(indent: 0, endIndent: 0, thickness: 1);

  ListTile _buildListTile(String title, String subtitle, double distance) {
    return ListTile(
      leading: const SizedBox(height: double.infinity, child: Icon(Icons.access_time, size: 28)),
      style: ListTileStyle.drawer,
      contentPadding: const EdgeInsets.all(0),
      title: Text(title, style: LTTextStyle.panelAddresTitleBold),
      subtitle: Text(subtitle, style: LTTextStyle.panelAddresSubtitle.copyWith(height: 2.5)),
      trailing: Text('$distance km', style: LTTextStyle.panelAddresTitleBold),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomWidth = MediaQuery.of(context).size.width - 60;
    return LadyTaxiBottomSheet(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: LocaleText('enter_an_adress', style: LTTextStyle.address, textAlign: TextAlign.center),
        ),
        SizedBox(
          height: 130,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(height: 35, child: DashLine(height: 2)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Center(child: Icon(Icons.adjust, size: 30, color: Colors.green)),
                      Center(child: Icon(Icons.location_on_rounded, size: 30, color: LTColors.primary)),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: bottomWidth * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: context.localeString('location'),
                          suffixIcon: const Icon(Icons.my_location),
                        ),
                      ),
                    ),
                    Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: context.localeString('where_to_go'),
                          suffixIcon: const Icon(Icons.location_on_rounded),
                        ),
                        onSubmitted: (value) {
                          func();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _buildDivider(),
        ListTile(
          leading: Image.asset('assets/icons/bookmark.png', color: LTColors.primary, cacheWidth: 22),
          contentPadding: const EdgeInsets.all(0),
          title: const LocaleText('save_location', style: LTTextStyle.panelAddresTitleBold),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        ),
        SizedBox(
          height: 245,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                _buildDivider(),
                _buildListTile('Najot Ta\'lim Qatortol', 'Tashkent, Uzbekistan', 2.5),
                _buildListTile('Najot Ta\'lim Qatortol', 'Tashkent, Uzbekistan', 2.5),
                _buildListTile('Najot Ta\'lim Qatortol', 'Tashkent, Uzbekistan', 2.5),
                _buildListTile('Najot Ta\'lim Qatortol', 'Tashkent, Uzbekistan', 2.5),
                _buildListTile('Najot Ta\'lim Qatortol', 'Tashkent, Uzbekistan', 2.5),
                _buildListTile('Najot Ta\'lim Qatortol', 'Tashkent, Uzbekistan', 2.5),
                _buildListTile('Najot Ta\'lim Qatortol', 'Tashkent, Uzbekistan', 2.5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
