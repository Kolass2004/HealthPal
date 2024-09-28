import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:health_pal/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_router.dart';
import 'package:health_pal/utils/app_styles.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/utils/show_toast.dart';
import 'package:health_pal/widgets/custom_button.dart';
import 'package:health_pal/widgets/loading_button.dart';
import 'package:health_pal/widgets/logo_text.dart';
import 'package:health_pal/widgets/or_line_widget.dart';
import 'package:health_pal/widgets/sign_in_text_fields.dart';
import 'package:health_pal/widgets/social_media_button.dart';
import 'package:health_pal/widgets/switch_between_sign_in_up.dart';
import 'package:toastification/toastification.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
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
            SignInTextFields(
              emailController: emailController,
              passwordController: passwordController,
            ),
            const SizedBox(
              height: 24,
            ),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccess) {
                  GoRouter.of(context).push(AppRouter.homeView);
                }
                if (state is SignInFailure) {
                  showToast(
                    state.titleErrorMessage,
                    state.descriptionErrMessage,
                    ToastificationType.error,
                    context,
                  );
                }
              },
              builder: (context, state) {
                SignInCubit signInCubit = BlocProvider.of<SignInCubit>(context);
                if (state is SignInLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      height: 48,
                      child: LoadingButton(),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      height: 48,
                      child: CustomButton(
                        title: "Sign In",
                        onPressed: () {
                          signInMethode(signInCubit);
                        },
                      ),
                    ),
                  );
                }
              },
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Ink(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot password? ",
                    style: Appstyles.styleMedium14.copyWith(
                      color: const Color(0xff1C64F2),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            SwitchBetweenSignInUpText(
              text: "Do you have an account yet?",
              page: "Sign Up",
              onPressed: () {
                GoRouter.of(context).push(AppRouter.signUpView);
              },
            ),
            const SizedBox(
              height: 21,
            ),
          ],
        ),
      ),
    );
  }

  void signInMethode(SignInCubit signInCubit) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      signInCubit.logInUserMethode(
        email: emailController.text,
        password: passwordController.text,
      );
      autovalidateMode = AutovalidateMode.disabled;
      emailController.clear();
      passwordController.clear();
      setState(() {});
    } else {
      autovalidateMode = AutovalidateMode.always;

      setState(() {});
    }
  }
}
