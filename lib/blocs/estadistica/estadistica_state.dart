part of 'estadistica_bloc.dart';

abstract class EstadisticaState extends Equatable {
  const EstadisticaState();

  @override
  List<Object> get props => [];
}

class EstadisticaInitial extends EstadisticaState {
  @override
  String toString() => 'EstadisticaInitial { estad: [] }';
}

class EstadisticaLoading extends EstadisticaState {
  @override
  String toString() => 'EstadisticaLoading { estad: [] }';
}

class EstadisticaLoaded extends EstadisticaState {
  final Estadistica estadistica;

  const EstadisticaLoaded(this.estadistica);

  @override
  List<Object> get props => [estadistica];

  @override
  String toString() => 'EstadisticaLoaded { estadisticas: $estadistica }';
}

class EstadisticaError extends EstadisticaState {
  final String error;
  const EstadisticaError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'EstadisticaError';
}
