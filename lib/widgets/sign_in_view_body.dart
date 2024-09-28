import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_router.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/custom_button.dart';
import 'package:health_pal/widgets/logo_text.dart';
import 'package:health_pal/widgets/or_line_widget.dart';
import 'package:health_pal/widgets/sign_in_text_fields.dart';
import 'package:health_pal/widgets/social_media_button.dart';
import 'package:health_pal/widgets/switch_between_sign_in_up.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 32,
          ),
          SvgPicture.asset(
            Assets.assetsLogoDark,
          ),
          const SizedBox(
            height: 16,
          ),
          const LogoText(
            color1: AppColors.grey500,
            color2: AppColors.grey900,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            "Hi, Welcome Back!",
            style: Appstyles.styleSemiBold20.copyWith(
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Hope you're doing fine.",
            style: Appstyles.styleRegular14.copyWith(
              color: AppColors.grey500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          const SignInTextFields(),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 48,
              child: CustomButton(
                title: "Sign In",
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const OrLineWidget(),
          const SizedBox(
            height: 21,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SocialMediaButton(
              title: "Sign in with Google",
              onPressed: () {},
              icon: Assets.assetsGoogleOriginal,
              isGoogle: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SocialMediaButton(
              title: "Sign in with Facebook",
              onPressed: () {},
              icon: Assets.assetsFacebook,
              isGoogle: false,
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              "Forgot password? ",
              style: Appstyles.styleMedium14.copyWith(
                color: const Color(0xff1C64F2),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          SwitchBetweenSignInUpText(
            text: "Do you have an account yet?",
            page: "Sign Up",
            onPressed: () {
              GoRouter.of(context).push(AppRouter.loginView)
            },
          ),
          const SizedBox(
            height: 21,
          ),
        ],
      ),
    );
  }
}
