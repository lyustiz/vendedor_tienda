class SolicitudDTO {
  final int idSolicitudVendedor;
  final int idVendedor;
  final int idProgramacionJuego;
  final String tipoSolicitud;
  final int cantidad;
  final String estado;
  final String fechaSolicitud;
  final String? fechaModificacion;

  SolicitudDTO(
      {required this.idSolicitudVendedor,
      required this.idVendedor,
      required this.idProgramacionJuego,
      required this.tipoSolicitud,
      required this.cantidad,
      required this.estado,
      required this.fechaSolicitud,
      this.fechaModificacion});

  /* factory SolicitudDTO.fromSolicitud(Solicitud solicitud,
      {required int idVendedor}) {
    return SolicitudDTO(
      idSolicitudVendedor: solicitud.idSolicitud,
      idVendedor: idVendedor,
      idProgramacionJuego: solicitud.idProgramacionJuego,
      tipoSolicitud: solicitud.tipoSolicitud,
      cantidad: solicitud.cantidad,
      estado: solicitud.estado,
      fechaSolicitud: solicitud.fechaSolicitud!.toIso8601String(),
      fechaModificacion: solicitud.fechaSolicitud!.toIso8601String(),
    );
  }

  static Solicitud toSolicitud(SolicitudDTO solicitudDTO) {
    return Solicitud(
      idSolicitud: solicitudDTO.idSolicitudVendedor,
      idProgramacionJuego: solicitudDTO.idProgramacionJuego,
      tipoSolicitud: solicitudDTO.tipoSolicitud,
      cantidad: solicitudDTO.cantidad,
      estado: solicitudDTO.estado,
      fechaSolicitud: DateTime.parse(solicitudDTO.fechaSolicitud),
      fechaRespuesta: solicitudDTO.fechaModificacion == null
          ? null
          : DateTime.parse(solicitudDTO.fechaModificacion!),
    );
  }

  static List<SolicitudDTO> fromListSolicitudes(List<Solicitud> clientes,
      {required int idVendedor}) {
    List<SolicitudDTO> solicitudesDTO = [];

    clientes.forEach((carton) {
      solicitudesDTO
          .add(SolicitudDTO.fromSolicitud(carton, idVendedor: idVendedor));
    });
    return solicitudesDTO;
  }

  Map<String, dynamic> toJson() {
    var serializer = JsonSerializer();
    return <String, dynamic>{
      'idSolicitudVendedor': serializer.toJson<int>(idSolicitudVendedor),
      'idVendedor': serializer.toJson<int>(idVendedor),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'tipoSolicitud': serializer.toJson<String>(tipoSolicitud),
      'cantidad': serializer.toJson<int?>(cantidad),
      'estado': serializer.toJson<String>(estado),
      'fechaSolicitud': serializer.toJson<String?>(fechaSolicitud),
      'fechaModificacion': serializer.toJson<String?>(fechaModificacion),
    };
  }

  factory SolicitudDTO.fromJson(Map<String, dynamic> json) {
    var serializer = JsonSerializer();
    return SolicitudDTO(
      idSolicitudVendedor:
          serializer.fromJson<int>(json['idSolicitudVendedor']),
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      tipoSolicitud: serializer.fromJson<String>(json['tipoSolicitud']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaSolicitud: serializer.fromJson<String>(json['fechaSolicitud']),
      fechaModificacion:
          serializer.fromJson<String?>(json['fechaModificacion']),
    );
  }*/
}
