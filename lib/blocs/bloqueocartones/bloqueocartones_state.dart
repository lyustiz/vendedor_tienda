part of 'bloqueocartones_bloc.dart';

abstract class BloqueoCartonesState extends Equatable {
  const BloqueoCartonesState();

  @override
  List<Object> get props => [];
}

class BloqueoCartonesInitial extends BloqueoCartonesState {
  @override
  String toString() => 'BloqueoCartonesInitial { cartones: [] }';
}

class BloqueoCartonesLoading extends BloqueoCartonesState {
  @override
  String toString() => 'BloqueoCartonesLoading { cartones: [] }';
}

class BloqueoCartonesExito extends BloqueoCartonesState {
  final String mensaje;
  final List<Carton> cartonesBloqueados;
  const BloqueoCartonesExito(
      {required this.mensaje, required this.cartonesBloqueados});

  @override
  List<Object> get props => [mensaje, cartonesBloqueados];

  @override
  String toString() {
    return 'BloqueoCartonesExito $mensaje';
  }
}

class BloqueoCartonesError extends BloqueoCartonesState {
  final String error;
  const BloqueoCartonesError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'BloqueoCartonesError $error';
  }
}
