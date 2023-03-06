import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/Repository/auth_repo.dart';
import '../../Models/user_info.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repo = AuthRepo();

  AuthBloc() : super(AuthInitial()) {
    //
    on<GetOtpCodeEvent>((event, emit) async {
      emit(AuthInitial());
      try {
        await _repo.getOtpCode(event.phoneNumber);
        emit(GetOtpCodeSuccessState());
      } on DioError catch (error) {
        emit(AuthErrorState(error));
      }
    });

    on<ConfirmOtpEvent>((event, emit) async {
      try {
        final UserInfoModel response =
            await _repo.confirmOtpCode(phoneNumber: event.phoneNumber, otpCode: event.otpCode);
        emit(VerifyOtpCodeSuccessState(response));
      } on DioError catch (error) {
        emit(AuthErrorState(error));
      }
    });
  }
}
