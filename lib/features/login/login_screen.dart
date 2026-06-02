import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/constants/app_images.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  'Welcome Back',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Please enter your credentials to access your workspace'),
                const SizedBox(height: 40),
                Text(
                  'EMAIL ADDRESS',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black43,
                  ),
                ),
                const SizedBox(height: 6),
                _textField('name@company.com'),
                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PASSWORD',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black43,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                _textField('*******', isPassWord: true),
                const SizedBox(height: 24),
                Row(
                  children: [
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Checkbox(
                        value: false,
                        onChanged: (value) {},
                        activeColor: AppColor.primaryColor,
                        checkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(4),
                        ),
                        side: BorderSide(color: AppColor.greyC3),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text('Stay signed in for 30 days'),
                  ],
                ),
                const SizedBox(height: 24),
                AppButton(title: 'Sign In', hasIcon: false),
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
                      child: _socialButton('Google', AppImages.icGoogle),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: _socialButton('Apple', AppImages.icApple)),
                  ],
                ),
                const SizedBox(height: 32),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: AppColor.black43),
                    children: [
                      TextSpan(
                        text: "Create an Account",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _privacy('PRIVACY POLICY', () {}),
            _privacy('TERM OF SERVICE', () {}),
            _privacy('CONTACT SUPPORT', () {}),
          ],
        ),
      ),
    );
  }
}

Widget _textField(String hintText, {bool isPassWord = false}) {
  return TextFormField(
    obscureText: isPassWord,
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

Widget _socialButton(String label, String icon) {
  return OutlinedButton.icon(
    onPressed: () {},
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
