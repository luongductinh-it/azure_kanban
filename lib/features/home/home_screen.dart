import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/constants/app_images.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:azure_kanban/widgets/app_button.dart';
import 'package:dotted_border/dotted_border.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _overView(),
            const SizedBox(height: 40),
            _quickAccess(),
            _currentProject(),
            const SizedBox(height: 16),
            _quickAccessActivity(),
            const SizedBox(height: 16),
            _quickAccessDueSoon(),
            const SizedBox(height: 16),
            _myBoard(),
            const SizedBox(height: 16),
            _buildRecentActivity(),
          ],
        ),
      ),
    );
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

  Widget _quickAccess() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.black19,
                letterSpacing: -0.6,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _currentProject() {
    return Container(
      height: 192,
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/bg_project.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
        color: AppColor.greyE7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.star, color: AppColor.primaryColor, size: 20),
          const SizedBox(height: 8),
          Text(
            'Project Apha',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.black19,
            ),
          ),
          Text(
            '04 Delivery Milestone',
            style: TextStyle(color: AppColor.black43),
          ),
          const SizedBox(height: 37),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text(
                  '8 Active Tasks',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.black19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 56,
                height: 28,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColor.primaryColor,
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColor.primaryColor,
                        child: Text(
                          'A',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickAccessActivity() {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.greyF3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.green00.withValues(alpha: 0.2),
            ),
            padding: EdgeInsets.all(10),
            child: Image.asset(AppImages.icActivity),
          ),
          const SizedBox(height: 12),
          Text(
            'Activity',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.black19,
            ),
          ),
          const SizedBox(height: 46),
          Text(
            'You have 5 new notifications since your last login.',
            style: TextStyle(color: AppColor.black43),
          ),
        ],
      ),
    );
  }

  Widget _quickAccessDueSoon() {
    return Container(
      padding: EdgeInsets.all(24),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColor.greyF3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.greyCD.withValues(alpha: 0.3),
            ),
            padding: EdgeInsets.all(10),
            child: Image.asset(AppImages.icDueSoon),
          ),
          const SizedBox(height: 12),
          Text(
            'Due Soon',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.black19,
            ),
          ),
          const SizedBox(height: 46),
          Text(
            'You have 3 tasks due soon.',
            style: TextStyle(color: AppColor.black43),
          ),
        ],
      ),
    );
  }

  Widget _myBoard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Boards',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.black19,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 24),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return _buildBoardCard();
          },
          separatorBuilder: (_, index) {
            return SizedBox(height: 28);
          },
          itemCount: 3,
        ),
        const SizedBox(height: 3),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteNames.createBoard);
          },
          child: DottedBorder(
            options: RectDottedBorderOptions(
              dashPattern: [8, 6],
              strokeWidth: 2,
              color: AppColor.greyC3,
            ),

            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(66),
              child: Column(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: AppColor.greyED,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Icon(Icons.add),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Create Board',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black43,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBoardCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Color(0xff003D98).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.layers, color: AppColor.primaryColor),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Project Alpha',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.black19,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Internal team coordination and roadmaping for Q4 launch',
              style: TextStyle(color: AppColor.black43),
            ),
            const SizedBox(height: 20),
            Divider(color: AppColor.greyED, thickness: 1),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 16,
                  color: AppColor.black43,
                ),
                const SizedBox(width: 6),
                Text(
                  '12/14',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black43,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(Icons.comment_outlined, size: 16, color: AppColor.black43),
                const SizedBox(width: 6),
                Text(
                  '8',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black43,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColor.black19,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(height: 16),

        Container(
          decoration: BoxDecoration(
            color: AppColor.greyF3,
            borderRadius: BorderRadius.circular(32),
          ),
          padding: EdgeInsets.all(32),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (_, index) {
              return _buildActivityItem(
                'You added a new checklist item to Flight Booking',
                '2 hours ago',
              );
            },
            separatorBuilder: (_, index) {
              return SizedBox(height: 24);
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String activity, String time) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColor.greyED,
          radius: 20,
          child: Icon(Icons.person, color: AppColor.primaryColor),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(activity, style: TextStyle(color: AppColor.black19)),
              const SizedBox(height: 4),
              Text(time, style: TextStyle(color: AppColor.black43)),
            ],
          ),
        ),
      ],
    );
  }
}
