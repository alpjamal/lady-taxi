import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/data/BLoC/auth/auth_bloc.dart';
import 'package:lady_taxi/ui/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/../../utils/constants.dart';

class SignOutPanel extends StatelessWidget {
  const SignOutPanel({super.key, required this.context});
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthInitialState) {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const LadyTaxiSplashScreen()));
          await _clearPrefs();
        }
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: LTRadius.bottomSheet),
          ),
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 80, height: 3, color: LTColors.primary),
              LocaleText('sign_out', style: LTTextStyle.address.copyWith(color: LTColors.primary, height: 2.3)),
              const Divider(indent: 0, endIndent: 0, thickness: 1),
              LocaleText('sure', style: LTTextStyle.panelAddresTitle.copyWith(height: 2.5)),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const LocaleText('cancel'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(LogOutEvent());
                          Navigator.pop(context);
                        },
                        child: const LocaleText('continue'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _clearPrefs() async {
    // Cleares user data from device
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(LtPrefs.accessToken);
    prefs.remove(LtPrefs.name);
    prefs.remove(LtPrefs.gender);
  }
}
