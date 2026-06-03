import 'package:azure_kanban/features/sign_up/bloc/sign_up_event.dart';
import 'package:azure_kanban/features/sign_up/bloc/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpRequested>((event, emit) async {
      emit(SignUpLoading());
      try {
        //Logic signup
        final credential = await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        // Save data to firebase store
        await _firestore.collection('users').doc(credential.user!.uid).set({
          'uid': credential.user!.uid,
          'fullName': event.fullname,
          'email': event.email,
          'createAt': DateTime.now(),
        });
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure(e.toString()));
      }
    });
  }
}
