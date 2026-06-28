import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:azure_kanban/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class CreateBoardScreen extends StatefulWidget {
  const CreateBoardScreen({super.key});

  @override
  State<CreateBoardScreen> createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<Color> _backgrounds = [
    AppColor.primaryColor,
    AppColor.green00,
    AppColor.black4F,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greyF8,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, color: AppColor.grey64),
        ),
        title: Text(
          "Create New Board",
          style: TextStyle(
            color: AppColor.black19,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Help",
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  height: 192,
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: _getBackgroundDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "PREVIEW",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        "New Board Design",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.6,
                        ),
                      ),
                    ],
                  ),
                ),

                //name
                const SizedBox(height: 40),
                _buildLabel('BOARD NAME'),
                const SizedBox(height: 8),
                AppTextFormField(
                  hintText: "Enter Board Name...",
                  controller: _nameController,
                ),
                const SizedBox(height: 32),

                //decription
                _buildLabel('BOARD DESCRIPTION'),
                const SizedBox(height: 8),
                AppTextFormField(
                  hintText: "Enter description (Optional)",
                  controller: _descriptionController,
                ),
                const SizedBox(height: 32),

                //background
                _buildLabel('BACKGROUND'),
                const SizedBox(height: 8),
                SizedBox(
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _buildBackgroundItem(_backgrounds[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 12);
                    },
                    itemCount: _backgrounds.length,
                  ),
                ),
                const SizedBox(height: 32),

                //privacy level
                _buildLabel("PRIVACY LEVEL"),
                const SizedBox(height: 16),
                _buildPrivactOption(
                  title: "Private",
                  subtitle: "Only you can invited members can access.",
                  icon: Icons.lock,
                  iconBgColor: Color(0xffFFDAD6),
                  iconColor: Color(0xff93000A),
                  isSelected: true,
                ),
                const SizedBox(height: 12),
                _buildPrivactOption(
                  title: "Public",
                  subtitle: "Any one on internet can view this board.",
                  icon: Icons.language,
                  iconBgColor: Color(0xffAFECFF),
                  iconColor: Color(0xff004E5D),
                  isSelected: false,
                ),
                const SizedBox(height: 110),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 105,
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 16,
                bottom: 32,
              ),
              child: AppButton(title: "Create Board"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundItem(Color color) {
    return Container(
      width: 77,
      height: 77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
    );
  }

  Decoration _getBackgroundDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColor.primaryColor,
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: AppColor.black4F,
      ),
    );
  }

  Widget _buildPrivactOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black19,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: AppColor.black43),
                  ),
                ],
              ),
            ),
            RadioGroup<bool>(
              groupValue: true,
              onChanged: (bool? value) {
                onTap!();
              },
              child: Radio<bool>(
                value: isSelected,
                activeColor: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
