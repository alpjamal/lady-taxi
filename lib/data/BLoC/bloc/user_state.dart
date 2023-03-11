part of 'user_bloc.dart';

abstract class UserState extends Equatable {}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class GetUserSuccessState extends UserState {
  GetUserSuccessState(this.userInfo);
  final ActiveUserInfo userInfo;

  @override
  List<Object?> get props => [userInfo];
}

class GetUserErrorState extends UserState {
  GetUserErrorState(this.error);
  final DioError error;

  @override
  List<Object?> get props => [error];
}
