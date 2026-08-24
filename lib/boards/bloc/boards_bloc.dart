import 'package:azure_kanban/boards/bloc/boards_event.dart';
import 'package:azure_kanban/boards/bloc/boards_state.dart';
import 'package:azure_kanban/models/board_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardsBloc extends Bloc<BoardsEvent, BoardsState> {
  final _firebase = FirebaseFirestore.instance;
  List<BoardModel> _allBoards = [];

  BoardsBloc() : super(BoardsInitial()) {
    on<LoadBoards>(_handleGetBoards);
    on<SearchBoards>(_handleSearchBoards);
  }

  Future<void> _handleGetBoards(
    LoadBoards event,
    Emitter<BoardsState> emit,
  ) async {
    emit(BoardsLoading());
    try {
      final querySnapshot = await _firebase
          .collection("boards")
          .where("users", arrayContains: event.userId)
          .orderBy("createAt", descending: true)
          .get();
      _allBoards = querySnapshot.docs
          .map((doc) => BoardModel.fromMap(doc.data(), doc.id))
          .toList();
      emit(BoardsLoaded(boards: _allBoards));
    } catch (e) {
      print(e);
      emit(BoardsError(message: e.toString()));
    }
  }

  Future<void> _handleSearchBoards(
    SearchBoards event,
    Emitter<BoardsState> emit,
  ) async {
    if (state is BoardsLoaded || _allBoards.isNotEmpty) {
      if (event.searchName.isEmpty) {
        emit(BoardsLoaded(boards: _allBoards));
      } else {
        final filteredBoards = _allBoards.where((board) {
          return board.name.toLowerCase().contains(
            event.searchName.toLowerCase(),
          );
        }).toList();
        emit(BoardsLoaded(boards: filteredBoards));
      }
    }
  }
}
