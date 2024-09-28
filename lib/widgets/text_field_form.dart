import 'package:flutter/material.dart';
import 'package:health_pal/models/text_field_model.dart';
import 'package:health_pal/utils/assets.dart';
import 'package:health_pal/widgets/custom_text_field.dart';

class TextFieldsForm extends StatelessWidget {
  const TextFieldsForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          CustomTextField(
            textFieldModel: TextFieldModel(
              hint: "Your Name",
              icon: Assets.assetsUserIcon,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            textFieldModel: TextFieldModel(
              hint: "Your Email",
              icon: Assets.assetsEmailIcon,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
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
