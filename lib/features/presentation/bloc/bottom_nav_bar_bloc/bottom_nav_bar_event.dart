import 'package:equatable/equatable.dart';

sealed class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();

  @override
  List<Object> get props => [];
}

final class FetchBottomNavBarEventEvent extends BottomNavBarEvent {
  final int id;

  const FetchBottomNavBarEventEvent({required this.id});

  @override
  List<Object> get props => [id];
}
