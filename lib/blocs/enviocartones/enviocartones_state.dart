part of 'enviocartones_bloc.dart';

abstract class EnviocartonesState extends Equatable {
  const EnviocartonesState();

  @override
  List<Object> get props => [];
}

class EnviocartonesInitial extends EnviocartonesState {
  @override
  String toString() => 'EnviocartonesInitial { cartones: [] }';
}

class EnviocartonesLoading extends EnviocartonesState {
  @override
  String toString() => 'EnviocartonesLoading { cartones: [] }';
}

class EnviocartonesExito extends EnviocartonesState {
  final String mensaje;
  const EnviocartonesExito({required this.mensaje});

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() {
    return 'EnviocartonesExito $mensaje';
  }
}

class EnviocartonesError extends EnviocartonesState {
  final String error;
  const EnviocartonesError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'EnviocartonesError $error';
  }
}
