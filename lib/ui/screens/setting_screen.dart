import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:lady_taxi/data/cubit/theme_cubit/theme_cubit.dart';
import 'package:lady_taxi/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool notification = false;
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText('settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _settingCard(
              title: 'notifications',
              child: Switch.adaptive(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: LTColors.primary,
                value: notification,
                onChanged: (value) => notification = value,
              ),
            ),
            _settingCard(title: 'security', child: const Icon(Icons.arrow_forward_ios)),
            _settingCard(title: 'language', child: const Icon(Icons.arrow_forward_ios)),
            _settingCard(
              title: 'night_mode',
              child: Switch.adaptive(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: LTColors.primary,
                value: theme.isDark,
                onChanged: (value) => theme.changeTheme(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingCard({required String title, required Widget child}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: const BoxDecoration(color: LTColors.inputFill, borderRadius: BorderRadius.all(LTRadius.input)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocaleText(title, style: LTTextStyle.defaultStyle),
          child,
        ],
      ),
    );
  }
}
