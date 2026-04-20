import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String caption;

  const HomeEntity({
    required this.caption,
  });

  @override
  List<Object?> get props => [caption];
}