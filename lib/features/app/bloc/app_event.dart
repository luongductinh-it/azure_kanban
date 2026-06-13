import 'package:firebase_auth/firebase_auth.dart';

abstract class AppEvent {}

class AppStarted extends AppEvent {}

class AppUserChanged extends AppEvent {
  final User? user;

  AppUserChanged(this.user);
}

class AppLogoutRequested extends AppEvent{}