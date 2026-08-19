import 'package:azure_kanban/boards/boards_screen.dart';
import 'package:azure_kanban/constants/app_colors.dart';
import 'package:azure_kanban/features/home/home_screen.dart';
import 'package:azure_kanban/features/navigation/bloc/navigation_bloc.dart';
import 'package:azure_kanban/features/navigation/bloc/navigation_event.dart';
import 'package:azure_kanban/features/navigation/bloc/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  final List<Widget> _screen = const [
    HomeScreen(),
    BoardsScreen(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationUpdated) {
            return _screen[state.selectedIndex];
          }
          return _screen[0];
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
            child: Row(
              children: [
                _navigationItem(
                  Icons.home,
                  'Home',
                  state is NavigationUpdated && state.selectedIndex == 0 ||
                      state is NavigationInitial,
                  () {
                    context.read<NavigationBloc>().add(
                      NavigationItemSelected(0),
                    );
                  },
                ),
                _navigationItem(
                  Icons.dashboard,
                  'Boards',
                  state is NavigationUpdated && state.selectedIndex == 1,
                  () {
                    context.read<NavigationBloc>().add(
                      NavigationItemSelected(1),
                    );
                  },
                ),
                _navigationItem(
                  Icons.notifications,
                  'Notifications',
                  state is NavigationUpdated && state.selectedIndex == 2,
                  () {
                    context.read<NavigationBloc>().add(
                      NavigationItemSelected(2),
                    );
                  },
                ),
                _navigationItem(
                  Icons.person,
                  'Profile',
                  state is NavigationUpdated && state.selectedIndex == 3,
                  () {
                    context.read<NavigationBloc>().add(
                      NavigationItemSelected(3),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _navigationItem(
    IconData icon,
    String label,
    bool isSelected,
    VoidCallback? onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColor.blueEF : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColor.primaryColor : AppColor.grey94,
              ),
              SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppColor.primaryColor : AppColor.grey94,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}