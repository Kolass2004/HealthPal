import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_pal/cubits/display_user_cubit/display_user_cubit.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/widgets/user_status_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key, required this.userId});

  final String userId;

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DisplayUserCubit>(context).displayUserData(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayUserCubit, DisplayUserState>(
      builder: (context, state) {
        if (state is DisplayUserLoading) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: AppColors.primaryColor,
              size: 40,
            ),
          );
        } else if (state is DisplayUserFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is DisplayUserSuccess) {
          return UserStatusView(status: state.userModel.status);
        } else {
          return const Center(
            child: Text("error"),
          );
        }
      },
    );
  }
}
