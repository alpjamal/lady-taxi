import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../widgets/lt_bottom_sheet_widget.dart';
import '/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () => _showBottomSheet(context));
    Future.delayed(const Duration(milliseconds: 50), () => _showDialog(context));
  }

  _showDialog(ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        _timer = Timer(LadyTaxiDurations.alert, () => Navigator.of(context).pop());
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
      },
    ).then((val) {
      if (_timer!.isActive) {
        _timer!.cancel();
      }
    });
  }

  _showBottomSheet(ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: ctx,
      builder: (ctx) {
        return LadyTaxiBottomSheet(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Row(
                children: [
                  Image.asset(LadyTaxiIconsName.point, cacheWidth: 25),
                  const SizedBox(width: 20),
                  const Text('Chilonzor 9 dahasi 13', style: LadyTaxiTextStyles.address),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(child: const LocaleText('my_shipping_adress'), onPressed: () {}),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Image.asset(LadyTaxiIconsName.menu, cacheWidth: 17),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Image.asset(LadyTaxiIconsName.getLocation, color: LadyTaxiColors.primaryColor, cacheHeight: 22),
        ),
      ),
    );
  }
}
