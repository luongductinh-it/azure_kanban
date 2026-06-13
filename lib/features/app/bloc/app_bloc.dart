import 'package:azure_kanban/features/app/bloc/app_event.dart';
import 'package:azure_kanban/features/app/bloc/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppBloc() : super(AppInitial()) {
    on<AppStarted>(_onAppStarted);

    on<AppUserChanged>(_onAppUserChanged);

    on<AppLogoutRequested>(_onLogout);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    final user = _auth.currentUser;
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onAppUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) async {
    if (event.user != null) {
      emit(Authenticated(event.user!));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLogout(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    await _auth.signOut();
    emit(Unauthenticated());
  }
}
