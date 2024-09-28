import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_pal/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignInCubit(),
        child: const Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: SignInViewBody(),
        ),
      ),
    );
  }
}
