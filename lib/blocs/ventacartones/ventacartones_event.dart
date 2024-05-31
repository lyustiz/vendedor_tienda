part of 'ventacartones_bloc.dart';

abstract class VentaCartonesEvent extends Equatable {
  const VentaCartonesEvent();

  @override
  List<Object> get props => [];
}

class VentaCartonesInit extends VentaCartonesEvent {
  VentaCartonesInit();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'VentaCartonesInit';
}

class SetCartones extends VentaCartonesEvent {
  SetCartones();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SetCartones';
}

class VenderCartones extends VentaCartonesEvent {
  final int idProgramacionJuego;
  final int idVendedor;
  final String nombreCliente;
  final String correoCliente;
  final String telefonoCliente;
  final List<int> idsCartones;
  VenderCartones(this.idProgramacionJuego, this.idVendedor, this.nombreCliente,
      this.correoCliente, this.telefonoCliente, this.idsCartones);

  @override
  List<Object> get props => [
        idProgramacionJuego,
        idVendedor,
        nombreCliente,
        correoCliente,
        telefonoCliente,
        idsCartones
      ];

  @override
  String toString() => 'VenderCartones';
}
