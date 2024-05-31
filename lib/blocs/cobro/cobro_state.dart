part of 'cobro_bloc.dart';

abstract class CobroState extends Equatable {
  const CobroState();

  @override
  List<Object> get props => [];
}

class CobroInitial extends CobroState {
  @override
  String toString() => 'CobroInitial {}';
}

class CobroLoading extends CobroState {
  @override
  String toString() => 'CobroLoading { cobros: [] }';
}

class CobroLoaded extends CobroState {
  final Cobro cobro;

  CobroLoaded(Cobro cobro) : this.cobro = cobro;

  @override
  List<Object> get props => [cobro];

  @override
  String toString() => 'CobroLoaded { cobros: $cobro }';
}

class CobroesLoaded extends CobroState {
  final List<Cobro> cobros;

  CobroesLoaded(List<Cobro> cobros) : this.cobros = cobros;

  @override
  List<Object> get props => [cobros];

  @override
  String toString() => 'CobroLoaded { cobros: $cobros }';
}

class CobroExito extends CobroState {
  @override
  String toString() => 'CobroExito';
}

class CobroError extends CobroState {
  final String error;
  CobroError(this.error);
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'CobroError $error';
}
