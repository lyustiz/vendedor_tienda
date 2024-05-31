import 'package:vendedor_tienda/utils/json_serializer.dart';

class Carton {
  final int idCarton;
  final int? idJuego;
  final int idProgramacionJuego;
  final String serie;
  final int numero;
  final int numeroPagina;
  final int numeroHoja;
  final int numeroLinea;
  final int idVendedor;
  final int idCliente;
  final String? nombreCliente;
  final int? idSucursal;
  final String estado;
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
  final int p21;
  final int p22;
  final int p23;
  final int p24;
  final int p25;
  final DateTime? actualizado;

  Carton({
    required this.idCarton,
    this.idJuego,
    required this.idProgramacionJuego,
    required this.serie,
    required this.numero,
    required this.numeroPagina,
    required this.numeroHoja,
    required this.numeroLinea,
    required this.idVendedor,
    required this.idCliente,
    this.nombreCliente,
    this.idSucursal,
    required this.estado,
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
    required this.p21,
    required this.p22,
    required this.p23,
    required this.p24,
    required this.p25,
    this.actualizado,
  });

  factory Carton.initial() {
    return Carton(
      idCarton: 0,
      idProgramacionJuego: 0,
      serie: 'X',
      numero: 0,
      numeroPagina: 0,
      numeroHoja: 0,
      numeroLinea: 0,
      idVendedor: 0,
      idCliente: 0,
      estado: 'I',
      bloqueadoApp: 0,
      p1: 0,
      p2: 0,
      p3: 0,
      p4: 0,
      p5: 0,
      p6: 0,
      p7: 0,
      p8: 0,
      p9: 0,
      p10: 0,
      p11: 0,
      p12: 0,
      p13: 0,
      p14: 0,
      p15: 0,
      p16: 0,
      p17: 0,
      p18: 0,
      p19: 0,
      p20: 0,
      p21: 0,
      p22: 0,
      p23: 0,
      p24: 0,
      p25: 0,
      actualizado: null,
    );
  }

  factory Carton.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Carton(
      idCarton: serializer.fromJson<int>(json['idCarton']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      serie: serializer.fromJson<String>(json['serie']),
      numero: serializer.fromJson<int>(json['numero']),
      numeroPagina: serializer.fromJson<int>(json['numeroPagina']),
      numeroHoja: serializer.fromJson<int>(json['numeroHoja']),
      numeroLinea: serializer.fromJson<int>(json['numeroLinea']),
      idVendedor: serializer.fromJson<int>(json['idvendedor']),
      idCliente: serializer.fromJson<int>(json['idCliente']),
      estado: serializer.fromJson<String>(json['estado']),
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
      actualizado: serializer.fromJson<DateTime?>(json['actualizado']),
    );
  }

  static List<Carton> fromListJson(List<dynamic> juegosJson, String estado) {
    List<Carton> cartonesDTO = [];

    for (var juegoJson in juegosJson) {
      Carton juego = Carton.fromJson(juegoJson);
      if (juego.estado == estado || estado == '') {
        cartonesDTO.add(juego);
      }
    }

    return cartonesDTO;
  }

  factory Carton.fromJsonResumen(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Carton(
      idCarton: serializer.fromJson<int>(json['idCarton']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      serie: 'X',
      numero: serializer.fromJson<int>(json['numero']),
      numeroPagina: 0,
      numeroHoja: 0,
      numeroLinea: 0,
      idVendedor: serializer.fromJson<int>(json['idvendedor']),
      idCliente: 0,
      estado: serializer.fromJson<String>(json['estado']),
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
      actualizado: serializer.fromJson<DateTime?>(json['actualizado']),
    );
  }

  static List<Carton> fromListJsonResumen(
      List<dynamic> juegosJson, String estado) {
    List<Carton> cartonesDTO = [];

    for (var juegoJson in juegosJson) {
      Carton juego = Carton.fromJsonResumen(juegoJson);
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
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'serie': serializer.toJson<String>(serie),
      'numero': serializer.toJson<int>(numero),
      'numeroPagina': serializer.toJson<int>(numeroPagina),
      'numeroHoja': serializer.toJson<int>(numeroHoja),
      'numeroLinea': serializer.toJson<int>(numeroLinea),
      'idvendedor': serializer.toJson<int>(idVendedor),
      'idCliente': serializer.toJson<int>(idCliente),
      'estado': serializer.toJson<String>(estado),
      'bloqueadoApp': serializer.toJson<int>(bloqueadoApp),
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
      'p21': serializer.toJson<int>(p21),
      'p22': serializer.toJson<int>(p22),
      'p23': serializer.toJson<int>(p23),
      'p24': serializer.toJson<int>(p24),
      'p25': serializer.toJson<int>(p25),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }

  Carton copyWith({
    int? idCarton,
    int? idProgramacionJuego,
    String? serie,
    int? numero,
    int? numeroPagina,
    int? numeroHoja,
    int? numeroLinea,
    int? idVendedor,
    int? idCliente,
    String? estado,
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
    int? p25,
    DateTime? actualizado,
  }) =>
      Carton(
          idCarton: idCarton ?? this.idCarton,
          idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
          serie: serie ?? this.serie,
          numero: numero ?? this.numero,
          numeroPagina: numeroPagina ?? this.numeroPagina,
          numeroHoja: numeroHoja ?? this.numeroHoja,
          numeroLinea: numeroLinea ?? this.numeroLinea,
          idVendedor: idVendedor ?? this.idVendedor,
          idCliente: idCliente ?? this.idCliente,
          estado: estado ?? this.estado,
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
          actualizado: actualizado ?? this.actualizado);
}
