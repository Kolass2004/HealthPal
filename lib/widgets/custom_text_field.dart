import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_pal/models/text_field_model.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textFieldModel,
    required this.controller,
  });

  final TextFieldModel textFieldModel;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Appstyles.styleRegular14.copyWith(
        color: AppColors.primaryColor,
      ),
      onSaved: textFieldModel.onSaved,
      validator: textFieldModel.validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: createBorder(),
        enabledBorder: createBorder(),
        focusedBorder: createBorder(),
        hintText: textFieldModel.hint,
        hintStyle: Appstyles.styleRegular14.copyWith(
          color: AppColors.grey400,
        ),
        prefixIcon: SvgPicture.asset(
          textFieldModel.icon,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  OutlineInputBorder createBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.grey300,
      ),
    );
  }
}
