import 'package:vendedor_tienda/providers/DTO/premio_DTO.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class JuegoPremiosDTO {
  final int idProgramacionJuego;
  final int? idJuego;
  final String tipoJuego;
  final DateTime fechaProgramada;
  final DateTime? fechaCierre;
  final int moduloCartones;
  final String moneda;
  final double valorCarton;
  final int totalCartones;
  final double valorModulo;
  final int totalModulos;
  final int totalPremios;
  final String serie;
  final int cartonInicial;
  final int cartonFinal;
  final int hojaInicial;
  final int hojaFinal;
  final DateTime horaCierre;
  final int previoCierre;
  final int resultadoFinal;
  final String estado;
  final List<PremioDTO> premios;
  final String permitirDevolucion;
  final DateTime actualizado;
  final String cobrado;
  final DateTime? fechaEntregaCartones;
  final DateTime? fechaCobro;
  final String cerrado;
  final String cartonesAleatorios;
  final String cartonesEnJuego;
  final int cartonesPromocion;
  final String prefijoTelefonico;

  JuegoPremiosDTO(
      {required this.idProgramacionJuego,
      this.idJuego,
      required this.tipoJuego,
      required this.fechaProgramada,
      this.fechaCierre,
      required this.moduloCartones,
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
      required this.resultadoFinal,
      required this.estado,
      required this.premios,
      required this.permitirDevolucion,
      required this.actualizado,
      required this.cobrado,
      this.fechaEntregaCartones,
      this.fechaCobro,
      required this.cerrado,
      required this.cartonesAleatorios,
      required this.cartonesEnJuego,
      required this.cartonesPromocion,
      required this.prefijoTelefonico});

  factory JuegoPremiosDTO.fromJson(Map<String, dynamic> json) {
    List<PremioDTO> premios = PremioDTO.fromListJson(json['premios'] ?? []);
    var serializer = const JsonSerializer();
    return JuegoPremiosDTO(
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idJuego: serializer.fromJson<int?>(json['idJuego']),
      tipoJuego: serializer.fromJson<String>(json['tipoJuego']),
      fechaProgramada: serializer.fromJson<DateTime>(json['fechaProgramada']),
      fechaCierre: serializer.fromJson<DateTime?>(json['fechaCierre']),
      moduloCartones: serializer.fromJson<int>(json['moduloCartones']),
      moneda: serializer.fromJson<String>(json['moneda']),
      valorCarton: serializer.fromJson<double>(json['valorCarton']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      valorModulo: serializer.fromJson<double>(json['valorModulo']),
      totalModulos: serializer.fromJson<int>(json['totalModulos']),
      totalPremios: serializer.fromJson<int>(json['totalPremios']),
      serie: serializer.fromJson<String>(json['serie']),
      cartonInicial: serializer.fromJson<int>(json['cartonInicial']),
      cartonFinal: serializer.fromJson<int>(json['cartonFinal']),
      hojaInicial: serializer.fromJson<int>(json['hojaInicial']),
      hojaFinal: serializer.fromJson<int>(json['hojaFinal']),
      horaCierre: serializer.fromJson<DateTime>(json['horaCierre']),
      previoCierre: serializer.fromJson<int>(json['previoCierre']),
      resultadoFinal: serializer.fromJson<int>(json['resultadoFinal']),
      estado: serializer.fromJson<String>(json['estado']),
      premios: premios,
      permitirDevolucion:
          serializer.fromJson<String>(json['permitirDevolucion']),
      actualizado: serializer.fromJson<DateTime>(json['actualizado']),
      cobrado: serializer.fromJson<String>(json['cobrado']),
      fechaEntregaCartones:
          serializer.fromJson<DateTime?>(json['fechaEntregaCartones']),
      fechaCobro: serializer.fromJson<DateTime?>(json['fechaCobro']),
      cerrado: serializer.fromJson<String>(json['cerrado']),
      cartonesAleatorios:
          serializer.fromJson<String>(json['cartonesAleatorios']),
      cartonesEnJuego: serializer.fromJson<String>(json['cartonesEnJuego']),
      cartonesPromocion: serializer.fromJson<int>(json['cartonesPromocion']),
      prefijoTelefonico: serializer.fromJson<String>(json['prefijoTelefonico']),
    );
  }

  static List<JuegoPremiosDTO> fromListJson(
      List<dynamic> juegosJson, String estado) {
    List<JuegoPremiosDTO> juegoPremiosDTO = [];

    for (var juegoJson in juegosJson) {
      JuegoPremiosDTO juego = JuegoPremiosDTO.fromJson(juegoJson);
      if (juego.estado == estado || estado == '') {
        juegoPremiosDTO.add(juego);
      }
    }

    return juegoPremiosDTO;
  }

  JuegoPremiosDTO copyWith(
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
          int? totalPremios,
          String? serie,
          int? cartonInicial,
          int? cartonFinal,
          int? hojaInicial,
          int? hojaFinal,
          DateTime? horaCierre,
          int? previoCierre,
          int? resultadoFinal,
          String? estado,
          List<PremioDTO>? premios,
          String? permitirDevolucion,
          DateTime? actualizado,
          String? cobrado,
          DateTime? fechaEntregaCartones,
          DateTime? fechaCobro,
          String? cerrado,
          String? cartonesAleatorios,
          String? cartonesEnJuego,
          int? cartonesPromocion,
          String? prefijoTelefonico}) =>
      JuegoPremiosDTO(
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
          resultadoFinal: resultadoFinal ?? this.resultadoFinal,
          estado: estado ?? this.estado,
          premios: premios ?? this.premios,
          permitirDevolucion: permitirDevolucion ?? this.permitirDevolucion,
          actualizado: actualizado ?? this.actualizado,
          cobrado: cobrado ?? this.cobrado,
          fechaEntregaCartones:
              fechaEntregaCartones ?? this.fechaEntregaCartones,
          fechaCobro: fechaCobro ?? this.fechaCobro,
          cerrado: cerrado ?? this.cerrado,
          cartonesAleatorios: cartonesAleatorios ?? this.cartonesAleatorios,
          cartonesEnJuego: cartonesEnJuego ?? this.cartonesEnJuego,
          cartonesPromocion: cartonesPromocion ?? this.cartonesPromocion,
          prefijoTelefonico: prefijoTelefonico ?? this.prefijoTelefonico);
}
