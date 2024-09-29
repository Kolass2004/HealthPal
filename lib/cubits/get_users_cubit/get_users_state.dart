part of 'get_users_cubit.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUsersSuccess extends GetUsersState {
  final List<UserModel> usersList;

  GetUsersSuccess({required this.usersList});
}

final class GetUsersLoading extends GetUsersState {}

final class GetUsersFailure extends GetUsersState {
  final String errMessage;

  GetUsersFailure({required this.errMessage});
}
