import 'package:flutter/material.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SignInViewBody(),
      ),
    );
  }
}
