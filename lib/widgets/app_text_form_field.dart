import 'package:azure_kanban/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.isPassWord,
    this.hintText,
    this.validator,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.inputBorder,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isPassWord;
  final String? hintText;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputBorder? inputBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassWord ?? false,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColor.greyE7,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border:
            inputBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              borderSide: BorderSide.none,
            ),
      ),
    );
  } 
}
