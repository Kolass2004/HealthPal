import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/cubits/display_user_cubit/display_user_cubit.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/widgets/home_view_body.dart';
import 'package:health_pal/widgets/logo_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayUserCubit(),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: HomeViewBody(
            userId: userId,
          ),
          appBar: AppBar(
            title: const LogoText(),
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryColor,
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
          ),
        ),
      ),
    );
  }
}
