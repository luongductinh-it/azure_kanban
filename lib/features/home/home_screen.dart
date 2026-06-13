import 'package:azure_kanban/features/app/bloc/app_bloc.dart';
import 'package:azure_kanban/features/app/bloc/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<AppBloc>().add(AppLogoutRequested());
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
