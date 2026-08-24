import 'package:azure_kanban/boards/bloc/boards_bloc.dart';
import 'package:azure_kanban/boards/bloc/boards_event.dart';
import 'package:azure_kanban/features/create_board/bloc/create_board_bloc.dart';
import 'package:azure_kanban/features/create_board/create_board_screen.dart';
import 'package:azure_kanban/features/login/bloc/login_bloc.dart';
import 'package:azure_kanban/features/login/login_screen.dart';
import 'package:azure_kanban/features/navigation/bloc/navigation_bloc.dart';
import 'package:azure_kanban/features/navigation/navigation_screen.dart';
import 'package:azure_kanban/features/onboarding/onboarding_screen.dart';
import 'package:azure_kanban/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:azure_kanban/features/sign_up/sign_up_screen.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) {
            final uid = FirebaseAuth.instance.currentUser?.uid ?? "";
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => NavigationBloc()),
                BlocProvider(
                  create: (_) => BoardsBloc()..add(LoadBoards(userId: uid)),
                ),
              ],
              child: NavigationScreen(),
            );
          },
        );

      case RouteNames.createBoard:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CreateBoardBloc(),
            child: CreateBoardScreen(),
          ),
        );

      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
        );

      case RouteNames.signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpBloc(),
            child: SignUpScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
