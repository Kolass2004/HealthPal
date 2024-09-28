import 'package:flutter/material.dart';
import 'package:health_pal/models/text_field_model.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/custom_text_field.dart';

class TextFieldsForm extends StatelessWidget {
  const TextFieldsForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController,
      emailController,
      passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomTextField(
            controller: nameController,
            textFieldModel: TextFieldModel(
              hint: "Your Name",
              icon: Assets.assetsUserIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                } else {
                  return null;
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: emailController,
            textFieldModel: TextFieldModel(
              hint: "Your Email",
              icon: Assets.assetsEmailIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                } else {
                  return null;
                }
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: passwordController,
            textFieldModel: TextFieldModel(
              hint: "Password",
              icon: Assets.assetsLockIcon,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
