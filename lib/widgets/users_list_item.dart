import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_pal/cubits/get_users_cubit/get_users_cubit.dart';
import 'package:health_pal/models/user_model.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/widgets/custom_button.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
            color: Colors.black.withOpacity(.1),
          ),
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 15,
            spreadRadius: 6,
            color: Colors.black.withOpacity(.1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.grey200,
              ),
              child: const FittedBox(
                child: Icon(
                  Icons.person_4_sharp,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userModel.userName,
                    style: Appstyles.styleBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userModel.email,
                    style: Appstyles.styleMedium14.copyWith(
                      color: AppColors.grey600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(
                  color: AppColors.grey200,
                  height: 0,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: CustomButton(
                          title: "Decline",
                          isReversed: true,
                          onPressed: () {
                            BlocProvider.of<GetUsersCubit>(context)
                                .declineUser(userModel);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: CustomButton(
                          title: "Accept",
                          onPressed: () {
                            BlocProvider.of<GetUsersCubit>(context)
                                .acceptUser(userModel);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
