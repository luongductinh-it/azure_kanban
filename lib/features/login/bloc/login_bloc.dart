import 'package:azure_kanban/features/login/bloc/login_event.dart';
import 'package:azure_kanban/features/login/bloc/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  LoginBloc() : super(LoginInitial()) {
    on<LoginRequested>(_loginWithEmailPassword);
    on<LoginGoogleRequested>(_loginWithGoogleAccount);
  }

  Future<void> _loginWithEmailPassword(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (userCredential.user != null) {
        emit(LoginSuccess(userCredential.user!));
      }

    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> _loginWithGoogleAccount(
    LoginGoogleRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await _googleSignIn.initialize();
      GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      emit(LoginSuccess(user.user!));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
