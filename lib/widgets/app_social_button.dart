import 'package:azure_kanban/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppSocialButton extends StatelessWidget {
  const AppSocialButton({super.key, required this.label, required this.icon, this.onTap});

  final String label;
  final String icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      label: Text(label),
      icon: Image.asset(icon),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        backgroundColor: AppColor.greyColor,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
    );
  }
}
