part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class GetOtpCodeEvent extends AuthEvent {
  GetOtpCodeEvent(this.phoneNumber);
  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class ConfirmOtpEvent extends AuthEvent {
  ConfirmOtpEvent(this.phoneNumber, this.otpCode);
  final String phoneNumber;
  final String otpCode;

  @override
  List<Object?> get props => [phoneNumber, otpCode];
}

class CreateProfileEvent extends AuthEvent {
  CreateProfileEvent();

  @override
  List<Object?> get props => [];
}

class LogOutEvent extends AuthEvent {
  LogOutEvent();
  @override
  List<Object?> get props => [];
}
