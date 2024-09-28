import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health_pal/models/text_field_model.dart';
import 'package:health_pal/utils/app_colors.dart';
import 'package:health_pal/utils/app_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textFieldModel,
    required this.controller,
    this.isObscure = false, // Set default to false
  });

  final TextFieldModel textFieldModel;
  final TextEditingController controller;
  final bool isObscure;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    // Initialize isHidden only if it's a password field (isObscure = true)
    isHidden = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isObscure
          ? isHidden
          : false, // Only obscure if isObscure is true
      style: Appstyles.styleRegular14.copyWith(
        color: AppColors.primaryColor,
      ),
      onSaved: widget.textFieldModel.onSaved,
      validator: widget.textFieldModel.validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: createBorder(),
        // Show visibility toggle only for password fields (isObscure = true)
        suffixIcon: widget.isObscure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(
                  isHidden ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grey300,
                ),
              )
            : null,
        enabledBorder: createBorder(),
        focusedBorder: createBorder(),
        hintText: widget.textFieldModel.hint,
        hintStyle: Appstyles.styleRegular14.copyWith(
          color: AppColors.grey400,
        ),
        prefixIcon: SvgPicture.asset(
          widget.textFieldModel.icon,
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
