import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/utils/constants.dart';
import '/data/BLoC/auth/auth_bloc.dart';
import '../create_profile_screen/create_profile_widgest/input_field.dart';
import '../home_screen/home_screen.dart';
import './create_profile_widgest/profile_photo.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen(this.phoneNum, {super.key});
  final String phoneNum;
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  String _selectedGender = 'ayol';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const LocaleText('create')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CreateProfileSuccessState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
          } else if (state is AuthErrorState) {
            _showErrorSnackbar(state.error.message ?? 'Bad Response');
          }
        },
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
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.only(right: 10, left: 20),
                        decoration: const BoxDecoration(
                            color: LTColors.inputFill, borderRadius: BorderRadius.all(LTRadius.input)),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          style: LTTextStyle.defaultStyle,
                          value: _selectedGender,
                          onChanged: (value) => _setGender(value ?? _selectedGender),
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(value: 'ayol', child: Text('Ayol')),
                            DropdownMenuItem(value: 'erkak', child: Text('Erkak')),
                          ],
                        ),
                      ),
                      InputField(widget.phoneNum, enabled: false),
                      const SizedBox(height: 200),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () => context.read<AuthBloc>().add(CreateProfileEvent()),
                          child: state is! VerifyOtpCodeSuccessState
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

  _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: LTTextStyle.hisPayBtnErr),
      behavior: SnackBarBehavior.floating,
    ));
  }

  Future<void> _setGender(String gender) async {
    _selectedGender = gender;
    setState(() {});
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(LtPrefs.gender, gender);
  }
}
