import 'package:vendedor_tienda/entities/premio.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class Juego {
  final int idProgramacionJuego;
  final int? idJuego;
  final String tipoJuego;
  final DateTime fechaProgramada;
  final DateTime? fechaCierre;
  final int? moduloCartones;
  final String moneda;
  final double valorCarton;
  final int totalCartones;
  final double valorModulo;
  final int totalModulos;
  final double totalPremios;
  final String serie;
  final int cartonInicial;
  final int cartonFinal;
  final int hojaInicial;
  final int hojaFinal;
  final DateTime horaCierre;
  final int previoCierre;
  final String estado;
  final List<Premio> premios;
  final String permitirDevolucion;
  final DateTime actualizado;
  final int cartonesPromocion;
  final String cobrado;
  final DateTime? fechaCobro;
  final DateTime? fechaEntregaCartones;
  final String prefijoTelefonico;
  final String encabezadoCartones;

  Juego(
      {required this.idProgramacionJuego,
      this.idJuego,
      required this.tipoJuego,
      required this.fechaProgramada,
      this.fechaCierre,
      this.moduloCartones,
      required this.moneda,
      required this.valorCarton,
      required this.totalCartones,
      required this.valorModulo,
      required this.totalModulos,
      required this.totalPremios,
      required this.serie,
      required this.cartonInicial,
      required this.cartonFinal,
      required this.hojaInicial,
      required this.hojaFinal,
      required this.horaCierre,
      required this.previoCierre,
      required this.estado,
      required this.premios,
      required this.permitirDevolucion,
      required this.actualizado,
      required this.cartonesPromocion,
      required this.cobrado,
      this.fechaCobro,
      this.fechaEntregaCartones,
      required this.prefijoTelefonico,
      required this.encabezadoCartones});

  bool isCerrado() {
    if (estado == 'C') {
      return true;
    }
    if (horaCierre.compareTo(DateTime.now()) < 0) {
      return true;
    }
    return false;
  }

  bool isCobrado() {
    if (cobrado != 'N') {
      return true;
    }
    return false;
  }

  factory Juego.initial() {
    return Juego(
        idProgramacionJuego: 0,
        tipoJuego: 'B',
        fechaProgramada: DateTime.now(),
        moneda: 'es_CO',
        valorCarton: 0,
        totalCartones: 0,
        valorModulo: 0,
        totalModulos: 0,
        totalPremios: 0,
        serie: 'X',
        cartonInicial: 0,
        cartonFinal: 0,
        hojaInicial: 0,
        hojaFinal: 0,
        horaCierre: DateTime.now(),
        previoCierre: 0,
        estado: 'A',
        premios: List<Premio>.empty(),
        permitirDevolucion: 'N',
        actualizado: DateTime.now(),
        cartonesPromocion: 1,
        cobrado: 'N',
        prefijoTelefonico: '+58',
        encabezadoCartones: 'BINGO');
  }

  Juego copyWith(
      {int? idProgramacionJuego,
      int? idJuego,
      String? tipoJuego,
      DateTime? fechaProgramada,
      DateTime? fechaCierre,
      int? moduloCartones,
      String? moneda,
      double? valorCarton,
      int? totalCartones,
      double? valorModulo,
      int? totalModulos,
      double? totalPremios,
      String? serie,
      int? cartonInicial,
      int? cartonFinal,
      int? hojaInicial,
      int? hojaFinal,
      DateTime? horaCierre,
      int? previoCierre,
      String? estado,
      List<Premio>? premios,
      String? permitirDevolucion,
      DateTime? actualizado,
      int? cartonesPromocion,
      String? cobrado,
      DateTime? fechaCobro,
      DateTime? fechaEntregaCartones,
      String? prefijoTelefonico,
      String? encabezadoCartones}) {
    return Juego(
        idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
        idJuego: idJuego ?? this.idJuego,
        tipoJuego: tipoJuego ?? this.tipoJuego,
        fechaProgramada: fechaProgramada ?? this.fechaProgramada,
        fechaCierre: fechaCierre ?? this.fechaCierre,
        moduloCartones: moduloCartones ?? this.moduloCartones,
        moneda: moneda ?? this.moneda,
        valorCarton: valorCarton ?? this.valorCarton,
        totalCartones: totalCartones ?? this.totalCartones,
        valorModulo: valorModulo ?? this.valorModulo,
        totalModulos: totalModulos ?? this.totalModulos,
        totalPremios: totalPremios ?? this.totalPremios,
        serie: serie ?? this.serie,
        cartonInicial: cartonInicial ?? this.cartonInicial,
        cartonFinal: cartonFinal ?? this.cartonFinal,
        hojaInicial: hojaInicial ?? this.hojaInicial,
        hojaFinal: hojaFinal ?? this.hojaFinal,
        horaCierre: horaCierre ?? this.horaCierre,
        previoCierre: previoCierre ?? this.previoCierre,
        estado: estado ?? this.estado,
        premios: premios ?? this.premios,
        permitirDevolucion: permitirDevolucion ?? this.permitirDevolucion,
        actualizado: actualizado ?? this.actualizado,
        cartonesPromocion: cartonesPromocion ?? this.cartonesPromocion,
        cobrado: cobrado ?? this.cobrado,
        fechaCobro: fechaCobro ?? this.fechaCobro,
        fechaEntregaCartones: fechaEntregaCartones ?? this.fechaEntregaCartones,
        prefijoTelefonico: prefijoTelefonico ?? this.prefijoTelefonico,
        encabezadoCartones: encabezadoCartones ?? this.encabezadoCartones);
  }

  factory Juego.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    return Juego(
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idJuego: serializer.fromJson<int?>(json['idJuego']),
      tipoJuego: serializer.fromJson<String>(json['tipoJuego']),
      fechaProgramada: serializer.fromJson<DateTime>(json['fechaProgramada']),
      fechaCierre: serializer.fromJson<DateTime?>(json['fechaCierre']),
      moduloCartones: serializer.fromJson<int?>(json['moduloCartones']),
      moneda: serializer.fromJson<String>(json['moneda']),
      valorCarton: serializer.fromJson<double>(json['valorCarton']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      valorModulo: serializer.fromJson<double>(json['valorModulo']),
      totalModulos: serializer.fromJson<int>(json['totalModulos']),
      totalPremios: serializer.fromJson<double>(json['totalPremios']),
      serie: serializer.fromJson<String>(json['serie']),
      cartonInicial: serializer.fromJson<int>(json['cartonInicial']),
      cartonFinal: serializer.fromJson<int>(json['cartonFinal']),
      hojaInicial: serializer.fromJson<int>(json['hojaInicial']),
      hojaFinal: serializer.fromJson<int>(json['hojaFinal']),
      horaCierre: serializer.fromJson<DateTime>(json['horaCierre']),
      previoCierre: serializer.fromJson<int>(json['previoCierre']),
      estado: serializer.fromJson<String>(json['estado']),
      premios: Premio.fromListJson(json['premios']),
      permitirDevolucion:
          serializer.fromJson<String>(json['permitirDevolucion']),
      actualizado: serializer.fromJson<DateTime>(json['actualizado']),
      cartonesPromocion: serializer.fromJson<int>(json['cartonesPromocion']),
      cobrado: serializer.fromJson<String>(json['cobrado']),
      fechaCobro: serializer.fromJson<DateTime?>(json['fechaCobro']),
      fechaEntregaCartones:
          serializer.fromJson<DateTime?>(json['fechaEntregaCartones']),
      prefijoTelefonico: serializer.fromJson<String>(json['prefijoTelefonico']),
      encabezadoCartones:
          serializer.fromJson<String>(json['encabezadoCartones']),
    );
  }

  static List<Juego> fromListJson(List<dynamic> juegosJson, String estado) {
    List<Juego> juegos = [];

    for (var juegoJson in juegosJson) {
      Juego juego = Juego.fromJson(juegoJson);
      if (juego.estado == estado || estado == '') {
        juegos.add(juego);
      }
    }
    return juegos;
  }
}
