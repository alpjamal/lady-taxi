import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import './home_screen_widgets.dart';
import '/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  final _panelController = PanelController();
  bool isPanelOpen = false;
  bool isOnSecondPanel = false;
  double panelMaxHeight = LadyTaxiPanelHeight.little;
  double fabHeight = LadyTaxiPanelHeight.little;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 20), () => _showDialog(context));
  }

  _showDialog(ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        _timer = Timer(LadyTaxiDurations.alert, () => Navigator.of(context).pop());
        return const CongratulationDialog();
      },
    ).then((val) => _timer!.isActive ? _timer!.cancel() : null);
  }

  togglePanel() {
    isOnSecondPanel = !isOnSecondPanel;
    _panelController.close();
    Future.delayed(LadyTaxiDurations.panelOpen, () => _panelController.open());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SlidingUpPanel(
              controller: _panelController,
              maxHeight: panelMaxHeight,
              minHeight: 0,
              defaultPanelState: PanelState.OPEN,
              panelBuilder: (sc) => panelMaxHeight == LadyTaxiPanelHeight.little
                  ? LocationPanel(func: togglePanel)
                  : UserAddressPanel(func: togglePanel),
              borderRadius: const BorderRadius.only(
                  topLeft: LadyTaxiRadiuses.bottomSheet, topRight: LadyTaxiRadiuses.bottomSheet),
              body: Container(
                color: Colors.black38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MenuButton(),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              onPanelSlide: (position) {
                fabHeight = position * panelMaxHeight;
                if (position == 0) {
                  isOnSecondPanel
                      ? panelMaxHeight = LadyTaxiPanelHeight.large
                      : panelMaxHeight = LadyTaxiPanelHeight.little;
                }
                setState(() {});
              },
            ),
            Positioned(
              right: 20,
              bottom: fabHeight + 20,
              child: FloatingActionButton(
                onPressed: togglePanel,
                child: Image.asset(LadyTaxiIconsName.getLocation, color: LadyTaxiColors.primaryColor, cacheHeight: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
