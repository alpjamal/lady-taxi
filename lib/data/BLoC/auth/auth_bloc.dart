import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/Repository/auth_repo.dart';
import '../../Models/user_info.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _repo = AuthRepo();

  AuthBloc() : super(AuthInitialState()) {
    on<GetOtpCodeEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _repo.getOtpCode(event.phoneNumber);
        emit(GetOtpCodeSuccessState());
      } on DioError catch (error) {
        emit(AuthErrorState(error));
      }
    });

    on<ConfirmOtpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final UserInfoModel response = await _repo.confirmOtpCode(phoneNumber: event.phoneNumber, otpCode: event.otpCode);
        emit(VerifyOtpCodeSuccessState(response));
      } on DioError catch (error) {
        emit(AuthErrorState(error));
      }
    });

    on<CreateProfileEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final String accessToken = await _repo.createProfile();
        emit(CreateProfileSuccessState(accessToken));
      } on DioError catch (error) {
        emit(AuthErrorState(error));
      } catch (error) {
        emit(CreateProfileErrorState());
      }
    });

    on<LogOutEvent>((event, emit) async {
      emit(AuthInitialState());
    });
  }
}
