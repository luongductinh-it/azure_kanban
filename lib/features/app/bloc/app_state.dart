import 'package:firebase_auth/firebase_auth.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class Authenticated extends AppState {
  final User user;

  Authenticated(this.user);
}

class Unauthenticated extends AppState{}