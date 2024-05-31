part of 'venta_bloc.dart';

abstract class VentaEvent extends Equatable {
  const VentaEvent();

  @override
  List<Object> get props => [];
}

class VentaInit extends VentaEvent {
  VentaInit();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'VentaInit';
}

class GetVentas extends VentaEvent {
  final int idProgramacionJuego;
  GetVentas(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetVentas';
}

class GetResumenVentas extends VentaEvent {
  final int idProgramacionJuego;
  GetResumenVentas(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetResumenVentas';
}

class CancelarVenta extends VentaEvent {
  final Venta venta;
  final int idProgramacionJuego;
  final String observaciones;
  CancelarVenta(this.venta, this.idProgramacionJuego, this.observaciones);

  @override
  List<Object> get props => [venta, idProgramacionJuego, observaciones];

  @override
  String toString() => 'CancelarVenta';
}

class ReenviarCartonesVenta extends VentaEvent {
  final int idVenta;
  final String observaciones;
  ReenviarCartonesVenta(this.idVenta, this.observaciones);

  @override
  List<Object> get props => [idVenta, observaciones];

  @override
  String toString() => 'ReenviarCartonesVenta';
}

class ReenviarWhatsappVenta extends VentaEvent {
  final int idVenta;
  final String observaciones;
  ReenviarWhatsappVenta(this.idVenta, this.observaciones);

  @override
  List<Object> get props => [idVenta, observaciones];

  @override
  String toString() => 'ReenviarWhatsappVenta';
}

class ActualizarCorreoVenta extends VentaEvent {
  final int idProgramacionJuego;
  final int idVenta;
  final String correoCliente;
  ActualizarCorreoVenta(
      this.idProgramacionJuego, this.idVenta, this.correoCliente);

  @override
  List<Object> get props => [idProgramacionJuego, idVenta, correoCliente];

  @override
  String toString() => 'ActualizarCorreoVenta';
}

class ActualizarTelefonoVenta extends VentaEvent {
  final int idProgramacionJuego;
  final int idVenta;
  final String telefonoCliente;
  ActualizarTelefonoVenta(
      this.idProgramacionJuego, this.idVenta, this.telefonoCliente);

  @override
  List<Object> get props => [idProgramacionJuego, idVenta, telefonoCliente];

  @override
  String toString() => 'ActualizarTelefonoVenta';
}
