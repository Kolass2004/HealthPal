import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/cubits/get_users_cubit/get_users_cubit.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/widgets/admin_view_body.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUsersCubit(),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            actions: [
              IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.secondaryColor,
                ),
              )
            ],
            leading: const Icon(
              Icons.shield,
              color: Colors.white,
            ),
            backgroundColor: AppColors.primaryColor,
            title: Text(
              "Admin Pannel",
              style: Appstyles.styleMedium16.copyWith(
                color: AppColors.secondaryColor,
              ),
            ),
          ),
          body: const AdminViewBody(),
        ),
      ),
    );
  }
}
