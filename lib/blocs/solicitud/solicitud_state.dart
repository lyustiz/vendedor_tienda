part of 'solicitud_bloc.dart';

abstract class SolicitudState extends Equatable {
  const SolicitudState();

  @override
  List<Object> get props => [];
}

class SolicitudInitial extends SolicitudState {
  @override
  String toString() => 'SolicitudInitial {}';
}

class SolicitudLoading extends SolicitudState {
  @override
  String toString() => 'SolicitudLoading { solicitudes: [] }';
}

class SolicitudLoaded extends SolicitudState {
  final Solicitud solicitud;

  SolicitudLoaded(Solicitud solicitud) : this.solicitud = solicitud;

  @override
  List<Object> get props => [solicitud];

  @override
  String toString() => 'SolicitudLoaded { solicitudes: $solicitud }';
}

class SolicitudesLoaded extends SolicitudState {
  final List<Solicitud> solicitudes;

  SolicitudesLoaded(List<Solicitud> solicitudes)
      : this.solicitudes = solicitudes;

  @override
  List<Object> get props => [solicitudes];

  @override
  String toString() => 'SolicitudLoaded { solicitudes: $solicitudes }';
}

class SolicitudExito extends SolicitudState {
  @override
  String toString() => 'SolicitudExito';
}

class SolicitudError extends SolicitudState {
  final String error;
  const SolicitudError(this.error);
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'SolicitudError $error';
}
