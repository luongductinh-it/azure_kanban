import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/constants/app_images.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            Container(
              height: 310,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColor.primaryColor.withValues(alpha: 0.2),
                    AppColor.primaryColor.withValues(alpha: 0.1),
                    AppColor.green77Color.withValues(alpha: 0.1),
                    AppColor.whiteColor.withValues(alpha: 0.02),
                  ],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Center(
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(
                      left: 32,
                      right: 32,
                      bottom: 32,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        AppImages.onBroading,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.grid_view_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Azure Kanban',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Organize \nanything,\ntogether.',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Manage projects, track tasks, and collaborate in real-time with the world\'s most intuitive workspace.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 40),
                  AppButton(title: 'Get Started', onPressed: () {}),
                  const SizedBox(height: 16),
                  AppButton(
                    title: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                    color: AppColor.greyColor,
                    textColor: AppColor.defaultTextColor,
                    hasIcon: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
