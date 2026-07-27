abstract class CreateBoardState {}

class CreateBoardInitial extends CreateBoardState {}

class CreateBoardLoading extends CreateBoardState {}

class CreateBoardSuccess extends CreateBoardState {}

class CreateBoardFailure extends CreateBoardState {
  final String error;
  CreateBoardFailure({required this.error});
}
