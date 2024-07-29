part of 'estadistica_bloc.dart';

abstract class EstadisticaEvent extends Equatable {
  const EstadisticaEvent();

  @override
  List<Object> get props => [];
}

class GetEstadistica extends EstadisticaEvent {
  final int idProgramacionJuego;

  const GetEstadistica(this.idProgramacionJuego);

  @override
  List<Object> get props => [idProgramacionJuego];

  @override
  String toString() => 'GetEstadistica';
}
