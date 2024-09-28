import 'package:flutter/material.dart';
import 'package:health_pal/models/text_field_model.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/custom_text_field.dart';

class SignInTextFields extends StatelessWidget {
  const SignInTextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            textFieldModel: TextFieldModel(
              hint: "Your Email",
              icon: Assets.assetsEmailIcon,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: TextEditingController(),
            textFieldModel: TextFieldModel(
              hint: "Password",
              icon: Assets.assetsLockIcon,
            ),
          ),
        ],
      ),
    );
  }
}
