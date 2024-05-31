part of 'enviocartones_bloc.dart';

abstract class EnviocartonesEvent extends Equatable {
  const EnviocartonesEvent();

  @override
  List<Object> get props => [];
}

class EnvioCartonesInit extends EnviocartonesEvent {
  EnvioCartonesInit();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'EnvioCartonesCorreo';
}

class EnvioCartonesCorreo extends EnviocartonesEvent {
  final int idVenta;
  EnvioCartonesCorreo(this.idVenta);

  @override
  List<Object> get props => [idVenta];

  @override
  String toString() => 'EnvioCartonesCorreo $idVenta';
}

class EnvioCartonesWhatsapp extends EnviocartonesEvent {
  final int idVenta;
  EnvioCartonesWhatsapp(this.idVenta);

  @override
  List<Object> get props => [idVenta];

  @override
  String toString() => 'EnvioCartonesWhatsapp $idVenta';
}
