import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/constants/app_images.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:azure_kanban/widgets/app_privacy.dart';
import 'package:azure_kanban/widgets/app_social_button.dart';
import 'package:azure_kanban/widgets/app_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyF8,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 87),
          child: Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Join Azure Kanban',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Professional workflow management start here.'),
                const SizedBox(height: 40),

                Text(
                  'FULL NAME',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black43,
                  ),
                ),
                const SizedBox(height: 6),
                AppTextFormField(hintText: 'John Dan'),
                const SizedBox(height: 20),
                Text(
                  'EMAIL ADDRESS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black43,
                  ),
                ),
                const SizedBox(height: 6),
                AppTextFormField(hintText: 'name@company.com'),
                const SizedBox(height: 20),

                Text(
                  'PASSWORD',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black43,
                  ),
                ),
                const SizedBox(height: 6),
                AppTextFormField(hintText: '*******', isPassWord: true),
                const SizedBox(height: 20),
                AppButton(title: 'Sign Up', hasIcon: false),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColor.greyC3, thickness: 1),
                    ),
                    SizedBox(width: 16),
                    Text(
                      'OR CONTINUE WITH',
                      style: TextStyle(color: AppColor.black43, fontSize: 12),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Divider(color: AppColor.greyC3, thickness: 1),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: AppSocialButton(
                        label: 'Google',
                        icon: AppImages.icGoogle,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppSocialButton(
                        label: 'Apple',
                        icon: AppImages.icApple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: AppColor.black43),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, RouteNames.login);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsGeometry.only(bottom: 20),
        child: AppPrivacy(),
      ),
    );
  }
}
