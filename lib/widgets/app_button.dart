import 'package:azure_kanban/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.textColor,
    this.color,
    this.onPressed,
    this.hasIcon = true,
  });
  final String title;
  final Color? textColor;
  final Color? color;
  final VoidCallback? onPressed;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: color,
          gradient: color == null
              ? LinearGradient(
                  colors: [ AppColor.primaryColor,AppColor.blueCCColor],
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: textColor ?? Colors.white,
                ),
              ),
            ),
            if (hasIcon) ...[
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ],
        ),
      ),
    );
  }
}
