import 'package:vendedor_tienda/utils/json_serializer.dart';

class CartonDTO {
  final int idCarton;
  final int? idJuego;
  final int idProgramacionJuego;
  final int idSerie;
  final String serie;
  final int numero;
  final int numeroHoja;
  final int numeroPagina;
  final int numeroLinea;
  final int? idModulo;
  final int? numeroModulo;
  final int idvendedor;
  final int? idCliente;
  final String? nombreCliente;
  final int? idSucursal;
  final String estado;
  final DateTime? actualizado;
  final int bloqueadoApp;
  final int p1;
  final int p2;
  final int p3;
  final int p4;
  final int p5;
  final int p6;
  final int p7;
  final int p8;
  final int p9;
  final int p10;
  final int p11;
  final int p12;
  final int p13;
  final int p14;
  final int p15;
  final int p16;
  final int p17;
  final int p18;
  final int p19;
  final int p20;
  final int? p21;
  final int? p22;
  final int? p23;
  final int? p24;
  final int? p25;

  CartonDTO({
    required this.idCarton,
    this.idJuego,
    required this.idProgramacionJuego,
    required this.idSerie,
    required this.serie,
    required this.numero,
    required this.numeroHoja,
    required this.numeroPagina,
    required this.numeroLinea,
    this.idModulo,
    this.numeroModulo,
    required this.idvendedor,
    this.idCliente,
    this.nombreCliente,
    this.idSucursal,
    required this.estado,
    this.actualizado,
    required this.bloqueadoApp,
    required this.p1,
    required this.p2,
    required this.p3,
    required this.p4,
    required this.p5,
    required this.p6,
    required this.p7,
    required this.p8,
    required this.p9,
    required this.p10,
    required this.p11,
    required this.p12,
    required this.p13,
    required this.p14,
    required this.p15,
    required this.p16,
    required this.p17,
    required this.p18,
    required this.p19,
    required this.p20,
    this.p21 = 0,
    this.p22 = 0,
    this.p23 = 0,
    this.p24 = 0,
    this.p25 = 0,
  });

  factory CartonDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return CartonDTO(
      idCarton: serializer.fromJson<int>(json['idCarton']),
      idJuego: serializer.fromJson<int>(json['idJuego']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idSerie: serializer.fromJson<int>(json['idSerie']),
      serie: serializer.fromJson<String>(json['serie'] ?? '-'),
      numero: serializer.fromJson<int>(json['numero']),
      numeroHoja: serializer.fromJson<int>(json['numeroHoja'] ?? 0),
      numeroPagina: serializer.fromJson<int>(json['numeroPagina'] ?? 0),
      numeroLinea: serializer.fromJson<int>(json['numeroLinea'] ?? 0),
      idModulo: serializer.fromJson<int>(json['idModulo'] ?? 0),
      numeroModulo: serializer.fromJson<int>(json['numeroModulo'] ?? 0),
      idvendedor: serializer.fromJson<int>(json['idvendedor'] ?? 0),
      idCliente: serializer.fromJson<int>(json['idCliente'] ?? 0),
      nombreCliente: serializer.fromJson<String?>(json['nombreCliente']),
      idSucursal: serializer.fromJson<int?>(json['idSucursal']),
      estado: serializer.fromJson<String>(json['estado']),
      actualizado: serializer.fromJson<DateTime>(json['actualizado']),
      bloqueadoApp: serializer.fromJson<int>(json['bloqueadoApp']),
      p1: serializer.fromJson<int>(json['p1']),
      p2: serializer.fromJson<int>(json['p2']),
      p3: serializer.fromJson<int>(json['p3']),
      p4: serializer.fromJson<int>(json['p4']),
      p5: serializer.fromJson<int>(json['p5']),
      p6: serializer.fromJson<int>(json['p6']),
      p7: serializer.fromJson<int>(json['p7']),
      p8: serializer.fromJson<int>(json['p8']),
      p9: serializer.fromJson<int>(json['p9']),
      p10: serializer.fromJson<int>(json['p10']),
      p11: serializer.fromJson<int>(json['p11']),
      p12: serializer.fromJson<int>(json['p12']),
      p13: serializer.fromJson<int>(json['p13']),
      p14: serializer.fromJson<int>(json['p14']),
      p15: serializer.fromJson<int>(json['p15']),
      p16: serializer.fromJson<int>(json['p16']),
      p17: serializer.fromJson<int>(json['p17']),
      p18: serializer.fromJson<int>(json['p18']),
      p19: serializer.fromJson<int>(json['p19']),
      p20: serializer.fromJson<int>(json['p20']),
      p21: serializer.fromJson<int>(json['p21']),
      p22: serializer.fromJson<int>(json['p22']),
      p23: serializer.fromJson<int>(json['p23']),
      p24: serializer.fromJson<int>(json['p24']),
      p25: serializer.fromJson<int>(json['p25']),
    );
  }

  static List<CartonDTO> fromListJson(List<dynamic> juegosJson, String estado) {
    List<CartonDTO> cartonesDTO = [];

    for (var juegoJson in juegosJson) {
      CartonDTO juego = CartonDTO.fromJson(juegoJson);
      if (juego.estado == estado || estado == '') {
        cartonesDTO.add(juego);
      }
    }

    return cartonesDTO;
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idCarton': serializer.toJson<int>(idCarton),
      'idJuego': serializer.toJson<int>(idJuego ?? 0),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'numero': serializer.toJson<int>(numero),
      'numeroHoja': serializer.toJson<int>(numeroHoja),
      'numeroPagina': serializer.toJson<int>(numeroPagina),
      'numeroLinea': serializer.toJson<int>(numeroLinea),
      'idModulo': serializer.toJson<int?>(idModulo ?? 0),
      'numeroModulo': serializer.toJson<int?>(numeroModulo ?? 0),
      'idVendedor': 0,
      'idSerie': 0,
      'serie': serializer.toJson<String>(serie),
      'numeroSerie': serializer.toJson<int>(numero),
      'idCliente': serializer.toJson<int?>(idCliente),
      'nombreCliente': serializer.toJson<String?>(nombreCliente),
      'idSucursal': serializer.toJson<int?>(idSucursal),
      'estado': serializer.toJson<String?>(estado),
      'p1': serializer.toJson<int>(p1),
      'p2': serializer.toJson<int>(p2),
      'p3': serializer.toJson<int>(p3),
      'p4': serializer.toJson<int>(p4),
      'p5': serializer.toJson<int>(p5),
      'p6': serializer.toJson<int>(p6),
      'p7': serializer.toJson<int>(p7),
      'p8': serializer.toJson<int>(p8),
      'p9': serializer.toJson<int>(p9),
      'p10': serializer.toJson<int>(p10),
      'p11': serializer.toJson<int>(p11),
      'p12': serializer.toJson<int>(p12),
      'p13': serializer.toJson<int>(p13),
      'p14': serializer.toJson<int>(p14),
      'p15': serializer.toJson<int>(p15),
      'p16': serializer.toJson<int>(p16),
      'p17': serializer.toJson<int>(p17),
      'p18': serializer.toJson<int>(p18),
      'p19': serializer.toJson<int>(p19),
      'p20': serializer.toJson<int>(p20),
      'p21': serializer.toJson<int>(p21 ?? 0),
      'p22': serializer.toJson<int>(p22 ?? 0),
      'p23': serializer.toJson<int>(p23 ?? 0),
      'p24': serializer.toJson<int>(p24 ?? 0),
      'p25': serializer.toJson<int>(p25 ?? 0),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }

  CartonDTO copyWith(
          {int? idCarton,
          int? idJuego,
          int? idProgramacionJuego,
          int? idSerie,
          String? serie,
          int? numero,
          int? numeroHoja,
          int? numeroPagina,
          int? numeroLinea,
          int? idModulo,
          int? numeroModulo,
          int? idvendedor,
          int? idCliente,
          String? nombreCliente,
          int? idSucursal,
          String? estado,
          DateTime? actualizado,
          int? bloqueadoApp,
          int? p1,
          int? p2,
          int? p3,
          int? p4,
          int? p5,
          int? p6,
          int? p7,
          int? p8,
          int? p9,
          int? p10,
          int? p11,
          int? p12,
          int? p13,
          int? p14,
          int? p15,
          int? p16,
          int? p17,
          int? p18,
          int? p19,
          int? p20,
          int? p21,
          int? p22,
          int? p23,
          int? p24,
          int? p25}) =>
      CartonDTO(
        idCarton: idCarton ?? this.idCarton,
        idJuego: idJuego ?? this.idJuego,
        idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
        idSerie: idSerie ?? this.idSerie,
        serie: serie ?? this.serie,
        numero: numero ?? this.numero,
        numeroHoja: numeroHoja ?? this.numeroHoja,
        numeroPagina: numeroPagina ?? this.numeroPagina,
        numeroLinea: numeroLinea ?? this.numeroLinea,
        idModulo: idModulo ?? this.idModulo,
        numeroModulo: numeroModulo ?? this.numeroModulo,
        idvendedor: idvendedor ?? this.idvendedor,
        idCliente: idCliente ?? this.idCliente,
        nombreCliente: nombreCliente ?? this.nombreCliente,
        idSucursal: idSucursal ?? this.idSucursal,
        estado: estado ?? this.estado,
        actualizado: actualizado ?? this.actualizado,
        bloqueadoApp: bloqueadoApp ?? this.bloqueadoApp,
        p1: p1 ?? this.p1,
        p2: p2 ?? this.p2,
        p3: p3 ?? this.p3,
        p4: p4 ?? this.p4,
        p5: p5 ?? this.p5,
        p6: p6 ?? this.p6,
        p7: p7 ?? this.p7,
        p8: p8 ?? this.p8,
        p9: p9 ?? this.p9,
        p10: p10 ?? this.p10,
        p11: p11 ?? this.p11,
        p12: p12 ?? this.p12,
        p13: p13 ?? this.p13,
        p14: p14 ?? this.p14,
        p15: p15 ?? this.p15,
        p16: p16 ?? this.p16,
        p17: p17 ?? this.p17,
        p18: p18 ?? this.p18,
        p19: p19 ?? this.p19,
        p20: p20 ?? this.p20,
        p21: p21 ?? this.p21,
        p22: p22 ?? this.p22,
        p23: p23 ?? this.p23,
        p24: p24 ?? this.p24,
        p25: p25 ?? this.p25,
      );
}
