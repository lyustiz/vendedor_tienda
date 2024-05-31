part of 'cartonselected_bloc.dart';

abstract class CartonselectedEvent extends Equatable {
  const CartonselectedEvent();

  @override
  List<Object> get props => [];
}

class SelectCarton extends CartonselectedEvent {
  final CartonDTO carton;
  const SelectCarton({required this.carton});
  @override
  List<Object> get props => [carton];
}

class RemoveCarton extends CartonselectedEvent {
  final Carton carton;
  const RemoveCarton({required this.carton});
  @override
  List<Object> get props => [carton];
}
