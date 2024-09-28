import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_pal/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/widgets/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SignUpCubit(),
        child: const Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: SignUpBody(),
        ),
      ),
    );
  }
}
