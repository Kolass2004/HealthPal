import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/utils/show_toast.dart';
import 'package:health_pal/widgets/custom_button.dart';
import 'package:health_pal/widgets/logo_text.dart';
import 'package:health_pal/widgets/or_line_widget.dart';
import 'package:health_pal/widgets/social_media_button.dart';
import 'package:health_pal/widgets/switch_between_sign_in_up.dart';
import 'package:health_pal/widgets/text_field_form.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
            "Create Account",
            style: Appstyles.styleSemiBold20.copyWith(
              color: AppColors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "We are here to help you! ",
            style: Appstyles.styleRegular14.copyWith(
              color: AppColors.grey500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          const TextFieldsForm(),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 48,
              child: CustomButton(
                title: "Create Account",
                onPressed: () {
                  showToast(context, "Account Created Successfully!",
                      "Welcome aboard! Your account has been created. Start exploring all the features we have to offer.");
                },
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
              title: "Continue with Google",
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
              title: "Continue with Facebook",
              onPressed: () {},
              icon: Assets.assetsFacebook,
              isGoogle: false,
            ),
          ),
          const SizedBox(
            height: 21,
          ),
          SwitchBetweenSignInUpText(
            text: "Do you have an account ?",
            page: "Sign In",
            onPressed: () {
              GoRouter.of(context).pop();
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
