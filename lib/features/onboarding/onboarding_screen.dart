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
                    Color(0xff0052CC).withValues(alpha: 0.2),
                    Color(0xff0052CC).withValues(alpha: 0.1),
                    Color(0xff006477).withValues(alpha: 0.1),
                    Color(0xffffffff).withValues(alpha: 0.02),
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
                        'assets/images/boarding.jpg',
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
                          color: Color(0xff003D98),
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
                          color: Color(0xff003D9B),
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
                  _buildButon('Get Started', () {}, hasIcon: true),
                  const SizedBox(height: 16),
                  _buildButon(
                    'Login',
                    () {},
                    color: Color(0xffE1E2E4),
                    textColor: Color(0xff333333),
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

Widget _buildButon(
  String text,
  VoidCallback onPressed, {
  Color? color,
  bool hasIcon = false,
  Color? textColor,
}) {
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
            ? LinearGradient(colors: [Color(0xff003D9B), Color(0xff0052CC)])
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: textColor ?? Colors.white),
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
