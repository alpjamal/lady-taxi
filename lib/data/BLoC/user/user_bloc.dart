import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:lady_taxi/data/Models/user_info.dart';
import 'package:lady_taxi/data/Repository/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _repo = UserRepo();

  UserBloc() : super(UserInitialState()) {
    on<GetUserEvent>((event, emit) async {
      emit(GetUserLoadingState());
      try {
        final userInfo = await _repo.getUserInfo();
         if (userInfo != null) {
          emit(GetUserSuccessState(userInfo));
        } else {
          emit(UserInitialState());
        }
      } on DioError catch (error) {
        emit(GetUserErrorState(error));
      }
    });
  }
}
