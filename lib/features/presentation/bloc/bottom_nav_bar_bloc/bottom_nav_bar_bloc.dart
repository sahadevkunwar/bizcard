
import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_nav_bar_event.dart';
import 'bottom_nav_bar_state.dart';


class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(Page1()) {
    on<FetchBottomNavBarEventEvent>(_fetchBottomNavBarEventEvent);
  }

  FutureOr<void> _fetchBottomNavBarEventEvent(
      FetchBottomNavBarEventEvent event, Emitter<BottomNavBarState> emit) {
    switch (event.id) {
      case 0:
        emit(Page1());
        break;
      case 1:
        emit(Page2());
        break;
      case 2:
        emit(Page3());
        break;
      case 3:
        emit(Page4());
        break;
      default:
        emit(Page1());
    }
  }
}
