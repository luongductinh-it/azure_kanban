import 'package:azure_kanban/boards/bloc/boards_bloc.dart';
import 'package:azure_kanban/boards/bloc/boards_event.dart';
import 'package:azure_kanban/features/app/bloc/app_bloc.dart';
import 'package:azure_kanban/features/app/bloc/app_event.dart';
import 'package:azure_kanban/features/app/bloc/app_state.dart';
import 'package:azure_kanban/features/navigation/bloc/navigation_bloc.dart';
import 'package:azure_kanban/features/navigation/navigation_screen.dart';
import 'package:azure_kanban/features/onboarding/onboarding_screen.dart';
import 'package:azure_kanban/routes/app_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()..add(AppStarted())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is Authenticated) {
              final user = FirebaseAuth.instance;
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => NavigationBloc()),
                  BlocProvider(
                    create: (context) => BoardsBloc()
                      ..add(LoadBoards(userId: user.currentUser?.uid ?? "")),
                  ),
                ],

                child: NavigationScreen(),
              );
            }
            if (state is Unauthenticated) {
              return OnBoardingScreen();
            }
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          },
        ),
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
