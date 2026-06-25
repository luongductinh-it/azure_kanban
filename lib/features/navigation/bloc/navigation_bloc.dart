import 'package:azure_kanban/features/navigation/bloc/navigation_event.dart';
import 'package:azure_kanban/features/navigation/bloc/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationItemSelected>((event, emit) {
      emit(NavigationUpdated(event.index));
    });
  }
}
