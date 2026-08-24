abstract class BoardsEvent {}

class LoadBoards extends BoardsEvent {
  final String userId;

  LoadBoards({required this.userId});
}

class SearchBoards extends BoardsEvent {
  final String searchName;

  SearchBoards({required this.searchName});
}
