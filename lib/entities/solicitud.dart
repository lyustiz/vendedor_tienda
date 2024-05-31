import 'package:vendedor_tienda/utils/json_serializer.dart';

class Solicitud {
  final int idSolicitudVendedor;
  final int idProgramacionJuego;
  final int idVendedor;
  final String tipoSolicitud;
  final int cantidad;
  final String estado;
  final DateTime fechaSolicitud;
  final DateTime? fechaModificacion;

  Solicitud({
    required this.idSolicitudVendedor,
    required this.idProgramacionJuego,
    required this.idVendedor,
    required this.tipoSolicitud,
    required this.cantidad,
    required this.estado,
    required this.fechaSolicitud,
    this.fechaModificacion,
  });

  factory Solicitud.initial() {
    return Solicitud(
        idSolicitudVendedor: 0,
        idProgramacionJuego: 0,
        idVendedor: 0,
        tipoSolicitud: 'C',
        cantidad: 0,
        estado: 'A',
        fechaSolicitud: DateTime.now(),
        fechaModificacion: null);
  }

  Solicitud copyWith(
          {int? idSolicitudVendedor,
          int? idProgramacionJuego,
          int? idVendedor,
          String? tipoSolicitud,
          int? cantidad,
          String? estado,
          DateTime? fechaSolicitud,
          DateTime? fechaModificacion}) =>
      Solicitud(
        idSolicitudVendedor: idSolicitudVendedor ?? this.idSolicitudVendedor,
        idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
        idVendedor: idVendedor ?? this.idVendedor,
        tipoSolicitud: tipoSolicitud ?? this.tipoSolicitud,
        cantidad: cantidad ?? this.cantidad,
        estado: estado ?? this.estado,
        fechaSolicitud: fechaSolicitud ?? this.fechaSolicitud,
        fechaModificacion: fechaModificacion ?? this.fechaModificacion,
      );

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idSolicitudVendedor': serializer.toJson<int>(idSolicitudVendedor),
      'idVendedor': serializer.toJson<int>(idVendedor),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'tipoSolicitud': serializer.toJson<String>(tipoSolicitud),
      'cantidad': serializer.toJson<int?>(cantidad),
      'estado': serializer.toJson<String>(estado),
      'fechaSolicitud': serializer.toJson<DateTime>(fechaSolicitud),
      'fechaModificacion': serializer.toJson<DateTime?>(fechaModificacion),
    };
  }

  factory Solicitud.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Solicitud(
      idSolicitudVendedor:
          serializer.fromJson<int>(json['idSolicitudVendedor']),
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      tipoSolicitud: serializer.fromJson<String>(json['tipoSolicitud']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaSolicitud: serializer.fromJson<DateTime>(json['fechaSolicitud']),
      fechaModificacion:
          serializer.fromJson<DateTime?>(json['fechaModificacion']),
    );
  }

  static List<Solicitud> fromListJson(List<dynamic> solicitudesJson) {
    List<Solicitud> solicitudes = [];

    for (var solicitudJson in solicitudesJson) {
      Solicitud solicitud = Solicitud.fromJson(solicitudJson);
      solicitudes.add(solicitud);
    }
    return solicitudes;
  }
}
