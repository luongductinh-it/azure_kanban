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
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isPassWord;
  final String? hintText;
  final Function(String)? onChanged;

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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
