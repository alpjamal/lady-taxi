import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/data/BLoC/bloc/user_bloc.dart';
import 'package:lady_taxi/ui/screens/home_screen/home_screen.dart';
import 'package:lady_taxi/utils/constants.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is GetUserSuccessState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen(state.userInfo)));
          }
        },
        builder: (context, state) {
          if (state is GetUserErrorState) {
            return const Center(child: Text('Oops, somethins went wrong!'));
          }
          return const Center(child: CircularProgressIndicator(color: LTColors.primary));
        },
      ),
    );
  }
}
