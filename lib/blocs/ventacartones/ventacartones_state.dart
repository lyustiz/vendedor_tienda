part of 'ventacartones_bloc.dart';

abstract class VentaCartonesState extends Equatable {
  const VentaCartonesState();

  @override
  List<Object> get props => [];
}

class VentaCartonesInitial extends VentaCartonesState {
  @override
  String toString() => 'VentaCartonesInitial { cartones: [] }';
}

class VentaCartonesLoading extends VentaCartonesState {
  @override
  String toString() => 'VentaCartonesLoading { cartones: [] }';
}

class VentaCartonesRefresh extends VentaCartonesState {
  @override
  String toString() => 'VentaCartonesRefresh { cartones: [] }';
}

class VentaCartonesExito extends VentaCartonesState {
  final String mensaje;
  final int idVenta;
  const VentaCartonesExito({required this.mensaje, required this.idVenta});

  @override
  List<Object> get props => [mensaje, idVenta];

  @override
  String toString() {
    return 'VentaCartonesExito $mensaje';
  }
}

class VentaCartonesError extends VentaCartonesState {
  final String error;
  const VentaCartonesError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'VentaCartonesError $error';
  }
}
