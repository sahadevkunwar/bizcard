import 'package:equatable/equatable.dart';

sealed class BottomNavBarState extends Equatable {
  const BottomNavBarState();

  @override
  List<Object> get props => [];
}

// final class HomePageInitial extends AdminHomePageState {}

final class Page1 extends BottomNavBarState {}

final class Page2 extends BottomNavBarState {}

final class Page3 extends BottomNavBarState {}

final class Page4 extends BottomNavBarState {}