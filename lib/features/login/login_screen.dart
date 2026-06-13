import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/constants/app_images.dart';
import 'package:azure_kanban/features/app/bloc/app_bloc.dart';
import 'package:azure_kanban/features/app/bloc/app_event.dart';
import 'package:azure_kanban/features/login/bloc/login_bloc.dart';
import 'package:azure_kanban/features/login/bloc/login_event.dart';
import 'package:azure_kanban/features/login/bloc/login_state.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:azure_kanban/utils/app_validators.dart';
import 'package:azure_kanban/utils/utils.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:azure_kanban/widgets/app_privacy.dart';
import 'package:azure_kanban/widgets/app_social_button.dart';
import 'package:azure_kanban/widgets/app_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyF8,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            Utils.showLoading(context);
          }
          if (state is LoginSuccess) {
            Utils.hideLoading(context);
            Utils.showSnackBarSuccess(context, "Login Success");
            context.read<AppBloc>().add(AppUserChanged(state.user));
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.home,
              (route) => false,
            );
          }
          if (state is LoginFailure) {
            Utils.hideLoading(context);
            Utils.showSnackBarError(context, state.error);
          }
        },
        child: Form(
          key: _formKey,
          child: Center(
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please enter your credentials to access your workspace',
                    ),
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
                    AppTextFormField(
                      hintText: 'name@company.com',
                      controller: _emailController,
                      validator: AppValidators.validateEmail,
                    ),
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
                    AppTextFormField(
                      hintText: '*******',
                      controller: _passwordController,
                      isPassWord: true,
                      validator: AppValidators.validatePassword,
                    ),
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
                    AppButton(
                      title: 'Sign In',
                      hasIcon: false,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(
                            LoginRequested(
                              _emailController.text.trim(),
                              _passwordController.text,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: AppColor.greyC3, thickness: 1),
                        ),
                        SizedBox(width: 16),
                        Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                            color: AppColor.black43,
                            fontSize: 12,
                          ),
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
                            onTap: () {
                              context.read<LoginBloc>().add(
                                LoginGoogleRequested(),
                              );
                            },
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
                        text: "Don't have an account? ",
                        style: TextStyle(color: AppColor.black43),
                        children: [
                          TextSpan(
                            text: "Create an Account",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.popAndPushNamed(
                                  context,
                                  RouteNames.signUp,
                                );
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsGeometry.only(bottom: 20),
        child: AppPrivacy(),
      ),
    );
  }
}
