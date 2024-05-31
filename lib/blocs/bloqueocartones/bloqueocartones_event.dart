part of 'bloqueocartones_bloc.dart';

abstract class BloqueoCartonesEvent extends Equatable {
  const BloqueoCartonesEvent();

  @override
  List<Object> get props => [];
}

class BloqueoCartonesInit extends BloqueoCartonesEvent {
  BloqueoCartonesInit();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'BloqueoCartonesInit';
}

class BloquearCartones extends BloqueoCartonesEvent {
  final int idProgramacionJuego;
  final int idVendedor;
  final List<Carton> cartones;
  BloquearCartones(this.idProgramacionJuego, this.idVendedor, this.cartones);

  @override
  List<Object> get props => [idProgramacionJuego, idVendedor, cartones];

  @override
  String toString() => 'BloquearCartones';
}
