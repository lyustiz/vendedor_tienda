part of 'solicitud_bloc.dart';

abstract class SolicitudEvent extends Equatable {
  const SolicitudEvent();

  @override
  List<Object> get props => [];
}

class InitSolicitud extends SolicitudEvent {
  InitSolicitud();

  @override
  String toString() => 'InitSolicitud';
}

class GetSolicitud extends SolicitudEvent {
  final Solicitud solicitud;

  GetSolicitud(this.solicitud);

  @override
  List<Object> get props => [solicitud];

  @override
  String toString() => 'GetSolicitud';
}

class GetAllSolicitud extends SolicitudEvent {
  final int idProgramacionJuego;
  final String estado;

  GetAllSolicitud(this.idProgramacionJuego, this.estado);

  @override
  List<Object> get props => [idProgramacionJuego, estado];

  @override
  String toString() => 'GetAllUsuario';
}

class UpdateSolicitud extends SolicitudEvent {
  final Solicitud solicitud;

  UpdateSolicitud(this.solicitud);

  @override
  List<Object> get props => [solicitud];

  @override
  String toString() => 'UpdateSolicitud';
}

class InsertSolicitud extends SolicitudEvent {
  final Solicitud solicitud;

  InsertSolicitud(this.solicitud);

  @override
  List<Object> get props => [solicitud];

  @override
  String toString() => 'InsertSolicitud $solicitud';
}

class DeleteSolicitud extends SolicitudEvent {
  final Solicitud solicitud;

  DeleteSolicitud(this.solicitud);

  @override
  List<Object> get props => [solicitud];

  @override
  String toString() => 'DeleteSolicitud';
}
