import 'package:azure_kanban/features/login/login_screen.dart';
import 'package:azure_kanban/features/onboarding/onboarding_screen.dart';
import 'package:azure_kanban/features/sign_up/sign_up_screen.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
      // return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
