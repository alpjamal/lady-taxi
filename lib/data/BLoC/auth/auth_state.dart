part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthErrorState extends AuthState {
  AuthErrorState(this.error);
  final DioError error;

  @override
  List<Object?> get props => [error];
}

class GetOtpCodeSuccessState extends AuthState {
  @override
  List<Object?> get props => [];
}

class VerifyOtpCodeSuccessState extends AuthState {
  VerifyOtpCodeSuccessState(this.userInfo);
  final UserInfoModel userInfo;

  @override
  List<Object?> get props => [userInfo];
}
