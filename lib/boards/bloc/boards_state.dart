import 'package:azure_kanban/models/board_model.dart';

abstract class BoardsState {}

class BoardsInitial extends BoardsState {}

class BoardsLoading extends BoardsState {}

class BoardsLoaded extends BoardsState {
  final List<BoardModel> boards;

  BoardsLoaded({required this.boards});
}

class BoardsError extends BoardsState {
  final String message;

  BoardsError({required this.message});

}
