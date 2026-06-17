import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyF8,
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: AppColor.primaryColor),
        title: Text(
          'Project Workspace',
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.tune, color: AppColor.grey64),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: _overView(),
      ),
    );
  }
}

Widget _overView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Overview".toUpperCase(),
        style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        'Good morning , Alex.',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.9,
          color: AppColor.black19,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        'You have 12 tasks across 3 boards requiring your attention today. Stay focused and keep the momentum going.',
        style: TextStyle(fontSize: 18, color: AppColor.black43),
      ),
      const SizedBox(height: 24),
      Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 220,
          child: AppButton(
            title: "Create New Task",
            hasIcon: false,
            leftIcon: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
