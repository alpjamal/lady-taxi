import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/utils/constants.dart';
import '/data/BLoC/auth/auth_bloc.dart';
import '../create_profile_screen/create_profile_widgest/input_field.dart';
import '../home_screen/home_screen.dart';
import 'create_profile_widgest/dropdown_menu.dart';
import 'create_profile_widgest/profile_photo.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen(this.phoneNum, {super.key});
  final String phoneNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const LocaleText('create')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) => _listener(context, state),
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ProfilePhoto(),
                      InputField(context.localeString('name')),
                      const GenderDropDown(),
                      InputField(phoneNum, enabled: false),
                      const SizedBox(height: 200),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () => context.read<AuthBloc>().add(CreateProfileEvent()),
                          child: state is AuthLoadingState
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const LocaleText('continue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _listener(ctx, state) async {
    if (state is CreateProfileSuccessState) {
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
      var prefs = await SharedPreferences.getInstance();
      prefs.setString(LtPrefs.accessToken, state.token);
    } else if (state is AuthErrorState) {
      _showErrorSnackbar(ctx, state.error.message ?? 'Bad Response');
    }
  }

  _showErrorSnackbar(ctx, String message) {
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Text(message, style: LTTextStyle.snackErr),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
