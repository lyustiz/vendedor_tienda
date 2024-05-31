part of 'juego_bloc.dart';

abstract class JuegoState extends Equatable {
  const JuegoState();

  @override
  List<Object> get props => [];
}

class JuegoInitial extends JuegoState {
  @override
  String toString() => 'JuegoInitial { juegos: [] }';
}

class JuegoLoading extends JuegoState {
  @override
  String toString() => 'JuegoLoading { juegos: [] }';
}

class JuegoLoaded extends JuegoState {
  final Juego juego;

  const JuegoLoaded(this.juego);

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'JuegoLoaded { juegos: $juego }';
}

class JuegosLoaded extends JuegoState {
  final List<Juego> juegos;

  const JuegosLoaded(this.juegos);

  @override
  List<Object> get props => [juegos];

  @override
  String toString() => 'JuegosLoaded { juegos: $juegos }';
}

class JuegosDetalleLoaded extends JuegoState {
  final List<Juego> juegos;

  const JuegosDetalleLoaded(this.juegos);

  @override
  List<Object> get props => [juegos];

  @override
  String toString() => 'JuegosDetalleLoaded { juegos: $juegos }';
}

class JuegoDetalleLoaded extends JuegoState {
  final Juego juego;

  const JuegoDetalleLoaded(this.juego);

  @override
  List<Object> get props => [juego];

  @override
  String toString() => 'JuegosDetalleLoaded { juegos: $juego }';
}

class JuegoSelected extends JuegoState {
  final Juego juego;

  const JuegoSelected(this.juego);
  @override
  String toString() => 'JuegoSelected $juego';
}

class JuegoError extends JuegoState {
  final String error;

  const JuegoError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'JuegoError';
}
