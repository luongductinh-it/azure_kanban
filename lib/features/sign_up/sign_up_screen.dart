import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/constants/app_images.dart';
import 'package:azure_kanban/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:azure_kanban/features/sign_up/bloc/sign_up_event.dart';
import 'package:azure_kanban/features/sign_up/bloc/sign_up_state.dart';
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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyF8,
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            Utils.showLoading(context);
          }
          if (state is SignUpFailure) {
            Utils.hideLoading(context);
            Utils.showSnackBarError(context, state.error);
          }
          if (state is SignUpSuccess) {
            Utils.hideLoading(context);
            Utils.showSnackBarSuccess(
              context,
              'Create an account successfully',
            );
            _formKey.currentState?.reset();
            _nameController.clear();
            _emailController.clear();
            _passwordController.clear();
          }
        },
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 87),
              child: Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Join Azure Kanban',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
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
                      AppTextFormField(
                        hintText: 'John Dan',
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your full name';
                          }
                        },
                      ),
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
                      AppTextFormField(
                        hintText: 'name@company.com',
                        controller: _emailController,
                        validator: AppValidators.validateEmail,
                      ),
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
                      AppTextFormField(
                        hintText: '*******',
                        isPassWord: true,
                        controller: _passwordController,
                        validator: AppValidators.validatePassword,
                      ),
                      const SizedBox(height: 20),
                      AppButton(
                        title: 'Sign Up',
                        hasIcon: false,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignUpBloc>().add(
                              SignUpRequested(
                                _nameController.text.trim(),
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
                            child: Divider(
                              color: AppColor.greyC3,
                              thickness: 1,
                            ),
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
                            child: Divider(
                              color: AppColor.greyC3,
                              thickness: 1,
                            ),
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
                                  Navigator.pushNamed(
                                    context,
                                    RouteNames.login,
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
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsGeometry.only(bottom: 20),
        child: AppPrivacy(),
      ),
    );
  }
}
