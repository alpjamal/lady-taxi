import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/data/BLoC/user/user_bloc.dart';

import '/ui/screens/home_screen/home_screen.dart';
import '/../utils/constants.dart';
import './registry_screen/registry_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserInitialState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RegistryScreen()));
          } else if (state is GetUserSuccessState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(state.userInfo)));
          }
        },
        builder: (context, state) {
          if (state is GetUserErrorState) {
            return Center(child: Text(state.error.response!.data['message']));
          }
          return const Center(child: CircularProgressIndicator(color: LTColors.primary));
        },
      ),
    );
  }
}
