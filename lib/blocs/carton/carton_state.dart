part of 'carton_bloc.dart';

abstract class CartonState extends Equatable {
  const CartonState();

  @override
  List<Object> get props => [];
}

class CartonInitial extends CartonState {
  @override
  String toString() => 'CartonInitial { cartones: [] }';
}

class CartonLoading extends CartonState {
  @override
  String toString() => 'CartonLoading { cartones: [] }';
}

class CartonLoaded extends CartonState {
  final Carton carton;

  CartonLoaded(carton) : this.carton = carton;

  @override
  List<Object> get props => [carton];

  @override
  String toString() => 'CartonLoaded { cartones: $carton }';
}

class CartonesLoaded extends CartonState {
  final List<Carton> cartones;

  CartonesLoaded(List<Carton> cartones) : this.cartones = cartones;

  @override
  List<Object> get props => [cartones];

  @override
  String toString() => 'CartonesLoaded { cartones: $cartones }';
}

class CartonesVenta extends CartonState {
  final List<Carton> cartones;

  CartonesVenta(List<Carton> cartones) : this.cartones = cartones;

  @override
  List<Object> get props => [cartones];

  @override
  String toString() => 'CartonesVenta { cartones: $cartones }';
}

class CartonExito extends CartonState {
  final String mensaje;
  const CartonExito({required this.mensaje});

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() {
    return 'CartonError $mensaje';
  }
}

class CartonError extends CartonState {
  final String error;
  const CartonError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'CartonError $error';
  }
}
