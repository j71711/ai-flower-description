import 'package:ai/features/home/domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final int selectedIndex;

  const HomeState({this.selectedIndex = 0});

  @override
  List<Object?> get props => [selectedIndex];
}

class HomeInitialState extends HomeState {
  const HomeInitialState({super.selectedIndex});
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState({required super.selectedIndex});
}

class HomeSuccessState extends HomeState {
  final HomeEntity result;

  const HomeSuccessState({
    required this.result,
    required super.selectedIndex,
  });

  @override
  List<Object?> get props => [result, selectedIndex];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({
    required this.message,
    required super.selectedIndex,
  });

  @override
  List<Object?> get props => [message, selectedIndex];
}