import 'package:azure_kanban/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppPrivacy extends StatelessWidget {
  const AppPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _privacy('PRIVACY POLICY', () {}),
        _privacy('TERM OF SERVICE', () {}),
        _privacy('CONTACT SUPPORT', () {}),
      ],
    );
  }
}

Widget _privacy(String text, VoidCallback? onTap) {
  return TextButton(
    onPressed: onTap,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: AppColor.grey73,
      ),
    ),
  );
}
