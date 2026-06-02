import 'package:azure_kanban/features/onboarding/onboarding_screen.dart';
import 'package:azure_kanban/routes/app_route.dart';
import 'package:azure_kanban/routes/route_names.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const OnBoardingScreen(),
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RouteNames.onBoarding,
    );
  }
}
