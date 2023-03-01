import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '/utils/constants.dart';
import './home_screen_widgets/congratulation_dialog.dart';
import './home_screen_widgets/user_drawer.dart';
import './home_screen_widgets/menu_button.dart';

import './home_screen_widgets/panel_location.dart';
import './home_screen_widgets/panel_enter_address.dart';
import './home_screen_widgets/panel_user_addresses.dart';
import './home_screen_widgets/panel_address_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  final _panelController = PanelController();
  double? fabBottomPadding;
  double _panelMaxHeight = LTPanelHeight.location;

  @override
  void initState() {
    super.initState();
    fabBottomPadding = _panelMaxHeight + 20;
    Future.delayed(LTDuration.alertBegin, () => _showDialog(context));
  }

  void _openDrawer(ctx) => Scaffold.of(ctx).openDrawer();

  _showDialog(ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        _timer = Timer(LTDuration.alert, () => Navigator.of(context).pop());
        return const CongratulationDialog();
      },
    ).then((val) => _timer!.cancel());
  }

  _togglePanel(double height) {
    _panelController.close().then((value) {
      _panelMaxHeight = height;
      Future.delayed(LTDuration.panelOpen, () => _panelController.open());
    });
  }

  _panelBuilder(ScrollController sc) {
    if (_panelMaxHeight == LTPanelHeight.location) {
      return LocationPanel(func: () => _togglePanel(LTPanelHeight.userAdresses));
    } else if (_panelMaxHeight == LTPanelHeight.userAdresses) {
      return UserAddressesPanel(func: () => _togglePanel(LTPanelHeight.enterAddress));
    } else if (_panelMaxHeight == LTPanelHeight.enterAddress) {
      return AddressEnteringPanel(func: () => _togglePanel(LTPanelHeight.addressInfo), controller: sc);
    }
    return AddressInfoPanel(func: () => _togglePanel(LTPanelHeight.location));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const UserDrawer(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SlidingUpPanel(
              controller: _panelController,
              borderRadius: const BorderRadius.only(topLeft: LTRadius.bottomSheet, topRight: LTRadius.bottomSheet),
              maxHeight: _panelMaxHeight,
              minHeight: 0,
              defaultPanelState: PanelState.OPEN,
              panelBuilder: (sc) => _panelBuilder(sc),
              onPanelSlide: (position) => setState(() => fabBottomPadding = position * _panelMaxHeight + 20),
            ),
            Positioned(top: 0, left: 0, child: MenuButton(onTap: _openDrawer)),
            Positioned(
              right: 20,
              bottom: fabBottomPadding!,
              child: FloatingActionButton(
                onPressed: () => _togglePanel(_panelMaxHeight),
                child: Image.asset(LTIconName.getLocation, color: LTColors.primary, cacheHeight: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
