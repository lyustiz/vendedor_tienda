part of 'cartonselected_bloc.dart';

class CartonselectedState extends Equatable {
  final List<CartonDTO> cartonesSelected;
  final int nroCartones;
  const CartonselectedState({
    required this.cartonesSelected,
    required this.nroCartones,
  });

  factory CartonselectedState.initial() {
    return CartonselectedState(cartonesSelected: [], nroCartones: 0);
  }

  @override
  List<Object> get props => [cartonesSelected, nroCartones];

  CartonselectedState copyWhith(
      {List<CartonDTO>? cartonesSelected, int? nroCartones}) {
    return CartonselectedState(
      cartonesSelected: cartonesSelected ?? this.cartonesSelected,
      nroCartones: nroCartones ?? this.nroCartones,
    );
  }

  @override
  String toString() =>
      '$runtimeType  CartonselectedState { $cartonesSelected }';
}
