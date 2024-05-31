part of 'cobro_bloc.dart';

abstract class CobroEvent extends Equatable {
  const CobroEvent();

  @override
  List<Object> get props => [];
}

class InitCobro extends CobroEvent {
  InitCobro();

  @override
  String toString() => 'InitCobro';
}

class GetCobro extends CobroEvent {
  final Cobro cobro;

  GetCobro(this.cobro);

  @override
  List<Object> get props => [cobro];

  @override
  String toString() => 'GetCobro';
}

class GetAllCobro extends CobroEvent {
  final int idProgramacionJuego;
  final String estado;

  GetAllCobro(this.idProgramacionJuego, this.estado);

  @override
  List<Object> get props => [idProgramacionJuego, estado];

  @override
  String toString() => 'GetAllUsuario';
}

class UpdateCobro extends CobroEvent {
  final Cobro cobro;

  UpdateCobro(this.cobro);

  @override
  List<Object> get props => [cobro];

  @override
  String toString() => 'UpdateCobro';
}

class InsertCobro extends CobroEvent {
  final int idProgramacionJuego;

  InsertCobro(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'InsertCobro idProgramacionJuego $idProgramacionJuego';
}

class DeleteCobro extends CobroEvent {
  final Cobro cobro;

  DeleteCobro(this.cobro);

  @override
  List<Object> get props => [cobro];

  @override
  String toString() => 'DeleteCobro';
}

class ResetCobro extends CobroEvent {
  final bool reset;
  ResetCobro(this.reset);

  @override
  List<Object> get props => [reset];

  @override
  String toString() => 'RessetCobro';
}
