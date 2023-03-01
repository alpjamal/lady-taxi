import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/utils/constants.dart';

import '../widgets/dash_line.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const LocaleText('history')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, dateIindex) {
          var object = history[dateIindex];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(object['date'],
                      style: LadyTaxiTextStyles.address.copyWith(fontSize: 18), textAlign: TextAlign.end),
                ),
                ...List.generate(
                  object['trips'].length,
                  (tripIndex) {
                    History trip = object['trips'][tripIndex];
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            _buildAddresses(trip),
                            const Positioned(left: 14, child: SizedBox(height: 25, child: DashLine(height: 3))),
                          ],
                        ),
                        const Divider(indent: 0, endIndent: 0, thickness: 1),
                        _buildPaymentInfo(trip),
                        const Divider(indent: 0, endIndent: 0, thickness: 1),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ListTile _buildPaymentInfo(History trip) {
    return ListTile(
      leading: const SizedBox(
          height: double.infinity, child: Icon(Icons.money_outlined, size: 30, color: LadyTaxiColors.green)),
      contentPadding: const EdgeInsets.all(0),
      title: Text(trip.payment, style: LadyTaxiTextStyles.hisPay),
      trailing: TextButton(
        onPressed: () {},
        child: trip.isCompleted
            ? const LocaleText('completed', style: LadyTaxiTextStyles.hisPayBtn)
            : const LocaleText('cancelled', style: LadyTaxiTextStyles.hisPayBtnErr),
      ),
    );
  }

  _buildAddresses(History trip) {
    return Column(
      children: [
        ListTile(
          leading:
              const SizedBox(height: double.infinity, child: Icon(Icons.adjust, size: 30, color: LadyTaxiColors.green)),
          contentPadding: const EdgeInsets.all(0),
          title: Text(trip.fromWhere, style: LadyTaxiTextStyles.panelAddresTitle),
        ),
        ListTile(
          leading: const SizedBox(
              height: double.infinity, child: Icon(Icons.location_on_rounded, size: 30, color: LadyTaxiColors.primary)),
          contentPadding: const EdgeInsets.all(0),
          title: Text(trip.whereTo, style: LadyTaxiTextStyles.panelAddresTitle),
        ),
      ],
    );
  }
}

List<Map<String, dynamic>> history = [
  {
    'date': 'Today',
    'trips': [
      History('Chilonzor', 'Samarqand Darvoza', '14 000 sum'),
      History('Chilonzor', 'Shayxontoxur', '8 500 sum', isCompleted: false),
    ],
  },
  {
    'date': 'Feb 20, 2023',
    'trips': [
      History('Chilonzor', 'Samarqand Darvoza', '15 600 sum'),
      History('Olmazor', 'Chilonzor', '20 300 sum'),
      History('Olmazor', 'Chilonzor', '14 000 sum', isCompleted: false),
      History('Olmazor', 'Chilonzor', '8 500 sum'),
      History('Olmazor', 'Chilonzor', '20 300 sum'),
      History('Chilonzor', 'Shayxontoxur', '14 000 sum', isCompleted: false),
    ],
  },
  {
    'date': 'Feb 15, 2023',
    'trips': [
      History('Chilonzor', 'Samarqand Darvoza', '20 300 sum', isCompleted: false),
      History('Olmazor', 'Chilonzor', '14 000 sum'),
      History('Chilonzor', 'Shayxontoxur', '8 500 sum'),
    ],
  },
  {
    'date': 'Jan 29, 2023',
    'trips': [
      History('Chilonzor', 'Samarqand Darvoza', '14 000 sum'),
      History('Olmazor', 'Chilonzor', '14 000 sum', isCompleted: false),
      History('Chilonzor', 'Shayxontoxur', '8 500 sum'),
      History('Chilonzor', 'Samarqand Darvoza', '8 500 sum'),
    ],
  },
];

class History {
  final String fromWhere;
  final String whereTo;
  final String payment;
  final bool isCompleted;
  History(this.fromWhere, this.whereTo, this.payment, {this.isCompleted = true});
}
