part of 'venta_bloc.dart';

abstract class VentaState extends Equatable {
  const VentaState();

  @override
  List<Object> get props => [];
}

class VentaInitial extends VentaState {
  @override
  String toString() => 'VentaInitial { ventas: [] }';
}

class VentaLoading extends VentaState {
  @override
  String toString() => 'VentaLoading { ventas: [] }';
}

class VentasLoaded extends VentaState {
  @override
  String toString() => 'VentaLoading { ventas: [] }';
}

class ResumenVentasLoaded extends VentaState {
  final ResumenVenta resumenVenta;
  const ResumenVentasLoaded({required this.resumenVenta});
  @override
  List<Object> get props => [resumenVenta];
  @override
  String toString() => 'ResumenVentasLoaded { resumen: [] }';
}

class VentaExito extends VentaState {
  final String mensaje;
  const VentaExito({required this.mensaje});

  @override
  List<Object> get props => [mensaje];
}

class VentaError extends VentaState {
  final String error;
  const VentaError({required this.error});

  @override
  List<Object> get props => [error];
}

// Cancelar Venta
class CancelarVentaLoading extends VentaState {}

class CancelarVentaExito extends VentaState {
  final String mensaje;
  const CancelarVentaExito({required this.mensaje});

  @override
  List<Object> get props => [mensaje];
}

class CancelarVentaError extends VentaState {
  final String error;
  const CancelarVentaError({required this.error});

  @override
  List<Object> get props => [error];
}

// Reenviar Cartones Venta
class ReenvioVentaLoading extends VentaState {}

class ReenvioVentaExito extends VentaState {
  final String mensaje;
  const ReenvioVentaExito({required this.mensaje});

  @override
  List<Object> get props => [mensaje];
}

class ReenvioVentaError extends VentaState {
  final String error;
  const ReenvioVentaError({required this.error});

  @override
  List<Object> get props => [error];
}

class ActualizarDatosLoading extends VentaState {}

class ActualizarDatosExito extends VentaState {
  final String mensaje;
  const ActualizarDatosExito({required this.mensaje});

  @override
  List<Object> get props => [mensaje];
}

class ActualizarDatosError extends VentaState {
  final String error;
  const ActualizarDatosError({required this.error});

  @override
  List<Object> get props => [error];
}
