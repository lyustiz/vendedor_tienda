part of 'carton_bloc.dart';

abstract class CartonEvent extends Equatable {
  const CartonEvent();

  @override
  List<Object> get props => [];
}

class GetCarton extends CartonEvent {
  final Carton carton;

  GetCarton(this.carton);

  @override
  List<Object> get props => [carton];

  @override
  String toString() => 'GetCarton';
}

class GetAllCarton extends CartonEvent {
  final int idProgramacionJuego;
  final String estado;
  GetAllCarton(this.idProgramacionJuego, this.estado);

  @override
  List<Object> get props => [idProgramacionJuego, estado];

  @override
  String toString() => 'GetAllCartones';
}

class GetCartonesVendidos extends CartonEvent {
  final int idProgramacionJuego;
  GetCartonesVendidos(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetCartonesVendidos';
}

class BloqueoCartones extends CartonEvent {
  final int idProgramacionJuego;
  final int idVendedor;
  final List<int> idsCartones;
  BloqueoCartones(this.idProgramacionJuego, this.idVendedor, this.idsCartones);

  @override
  List<Object> get props => [idProgramacionJuego, idVendedor, idsCartones];

  @override
  String toString() => 'BloqueoCartones';
}

class VentaCartones extends CartonEvent {
  final int idProgramacionJuego;
  final int idVendedor;
  final List<int> idsCartones;
  VentaCartones(this.idProgramacionJuego, this.idVendedor, this.idsCartones);

  @override
  List<Object> get props => [idProgramacionJuego, idVendedor, idsCartones];

  @override
  String toString() => 'VentaCartones';
}

class UpdateCarton extends CartonEvent {
  final Carton carton;
  final String estado;

  UpdateCarton(this.carton, this.estado);

  @override
  List<Carton> get props => [carton];

  @override
  String toString() => 'UpdateCarton';
}

class InsertCarton extends CartonEvent {
  final Carton carton;

  InsertCarton(this.carton);

  @override
  List<Carton> get props => [carton];

  @override
  String toString() => 'InsertCarton';
}

class DeleteCarton extends CartonEvent {
  final Carton carton;

  DeleteCarton(this.carton);

  @override
  List<Carton> get props => [carton];

  @override
  String toString() => 'DeleteCarton';
}

class SearchCarton extends CartonEvent {
  final String search;
  final int idProgramacionJuego;
  final String estado;

  SearchCarton(this.search, this.idProgramacionJuego, this.estado);

  @override
  List<Object> get props => [search];

  @override
  String toString() => 'SearchCarton ';
}

class UpateAllPromocionCarton extends CartonEvent {
  final int idProgramacionJuego;
  final int idPromocion;
  final int idCliente;
  final List<int> idCartones;

  UpateAllPromocionCarton(this.idProgramacionJuego, this.idPromocion,
      this.idCliente, this.idCartones);

  @override
  List<Object> get props =>
      [idProgramacionJuego, idPromocion, idCliente, idCartones];

  @override
  String toString() => 'UpateAllPromocionCarton ';
}

class UpateCartonesMultiple extends CartonEvent {
  final int idProgramacionJuego;
  final int idCliente;
  final List<int> idCartones;

  UpateCartonesMultiple(
    this.idProgramacionJuego,
    this.idCliente,
    this.idCartones,
  );

  @override
  List<Object> get props => [idProgramacionJuego, idCliente, idCartones];

  @override
  String toString() => 'UpateCartonesMultiple ';
}
