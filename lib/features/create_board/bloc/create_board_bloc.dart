import 'package:azure_kanban/features/create_board/bloc/create_board_event.dart';
import 'package:azure_kanban/features/create_board/bloc/create_board_state.dart';
import 'package:azure_kanban/models/board_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateBoardBloc extends Bloc<CreateBoardEvent, CreateBoardState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CreateBoardBloc() : super(CreateBoardInitial()) {
    on<CreateBoardSubmitted>(_handleCreateBoard);
  }

  Future<void> _handleCreateBoard(
    CreateBoardSubmitted event,
    Emitter<CreateBoardState> emit,
  ) async {
    try {
      emit(CreateBoardLoading());
      final docRef = _firestore.collection("boards").doc();
      final board = BoardModel(
        id: docRef.id,
        name: event.name,
        decriptions: event.decription,
        backgroundColorValue: event.backgroundColor.value,
        isPrivate: event.isPrivate,
        createAt: DateTime.now(),
        ownerId: _auth.currentUser?.uid ?? "",
        users: _auth.currentUser?.uid != null ? [_auth.currentUser!.uid] : [],
      );

      await docRef.set(board.toMap());
      emit(CreateBoardSuccess());
    } catch (e) {
      emit(CreateBoardFailure(error: e.toString()));
    }
  }
}
