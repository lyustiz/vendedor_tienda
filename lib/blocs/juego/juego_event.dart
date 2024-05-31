part of 'juego_bloc.dart';

abstract class JuegoEvent extends Equatable {
  const JuegoEvent();

  @override
  List<Object> get props => [];
}

class GetJuego extends JuegoEvent {
  final Juego juego;

  const GetJuego(this.juego);

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'GetJuego';
}

class GetAllJuego extends JuegoEvent {
  final String estado;
  const GetAllJuego(this.estado);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'GetAllUsuario';
}

class SelectJuego extends JuegoEvent {
  final JuegoPremiosDTO juego;

  const SelectJuego(this.juego);

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'SelectJuego';
}
