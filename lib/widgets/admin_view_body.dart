import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_pal/cubits/get_users_cubit/get_users_cubit.dart';
import 'package:health_pal/models/user_model.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/widgets/users_list_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AdminViewBody extends StatefulWidget {
  const AdminViewBody({super.key});

  @override
  State<AdminViewBody> createState() => _AdminViewBodyState();
}

class _AdminViewBodyState extends State<AdminViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUsersCubit>(context).getUsersMethode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(
      builder: (context, state) {
        if (state is GetUsersLoading) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: AppColors.primaryColor,
              size: 30,
            ),
          );
        } else if (state is GetUsersFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Appstyles.styleBold18,
            ),
          );
        } else if (state is GetUsersSuccess) {
          // Filter the users by status 'waiting'
          List<UserModel> waitingUsers = state.usersList
              .where((user) => user.status == Status.waiting)
              .toList();

          if (state.usersList.isEmpty) {
            return Center(
              child: Text(
                "There is no Users",
                style: Appstyles.styleBold16,
              ),
            );
          } else if (waitingUsers.isEmpty) {
            return Center(
              child: Text(
                "No users are currently waiting.",
                style: Appstyles.styleBold16,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: UsersListView(items: waitingUsers),
            );
          }
        } else {
          return const Text("ERROR");
        }
      },
    );
  }
}
