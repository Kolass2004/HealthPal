part of 'display_user_cubit.dart';

@immutable
sealed class DisplayUserState {}

final class DisplayUserInitial extends DisplayUserState {}

final class DisplayUserLoading extends DisplayUserState {}

final class DisplayUserSuccess extends DisplayUserState {
  final UserModel userModel;

  DisplayUserSuccess({required this.userModel});
}

final class DisplayUserFailure extends DisplayUserState {
  final String errMessage;

  DisplayUserFailure({required this.errMessage});
}
