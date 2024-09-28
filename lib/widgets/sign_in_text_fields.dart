import 'package:flutter/material.dart';
import 'package:health_pal/models/text_field_model.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/custom_text_field.dart';

class SignInTextFields extends StatelessWidget {
  const SignInTextFields({
    super.key,
    required this.passwordController,
    required this.emailController,
  });

  final TextEditingController emailController, passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            textFieldModel: TextFieldModel(
              hint: "Your Email",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                } else {
                  return null;
                }
              },
              icon: Assets.assetsEmailIcon,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: passwordController,
            isObscure: true,
            textFieldModel: TextFieldModel(
              hint: "Password",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                } else {
                  return null;
                }
              },
              icon: Assets.assetsLockIcon,
            ),
          ),
        ],
      ),
    );
  }
}
