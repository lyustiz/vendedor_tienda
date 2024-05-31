import 'package:vendedor_tienda/utils/json_serializer.dart';

class PremioDTO {
  final int idFigura;
  final int idPlenoAutomatico;
  final String nombre;
  final String posiciones;
  final String estado;
  final double valorPremio;
  final String acumula;
  final int carton;
  final int idUsuario;

  PremioDTO({
    required this.idFigura,
    required this.idPlenoAutomatico,
    required this.nombre,
    required this.posiciones,
    required this.estado,
    required this.valorPremio,
    required this.acumula,
    required this.carton,
    required this.idUsuario,
  });

  factory PremioDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return PremioDTO(
      idFigura: serializer.fromJson<int>(json['idFigura']),
      idPlenoAutomatico: serializer.fromJson<int>(json['idPlenoAutomatico']),
      nombre: serializer.fromJson<String>(json['nombre']),
      posiciones: serializer.fromJson<String>(json['posiciones']),
      estado: serializer.fromJson<String>(json['estado']),
      valorPremio: serializer.fromJson<double>(json['valorPremio']),
      acumula: serializer.fromJson<String>(json['acumula'] ?? 'N'),
      carton: serializer.fromJson<int>(json['carton']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
    );
  }

  static List<PremioDTO> fromListJson(List<dynamic> juegosJson) {
    List<PremioDTO> premiosDTO = [];

    for (var juegoJson in juegosJson) {
      premiosDTO.add(PremioDTO.fromJson(juegoJson));
    }

    return premiosDTO;
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idFigura': serializer.toJson<int>(idFigura),
      'idPlenoAutomatico': serializer.toJson<int>(idPlenoAutomatico),
      'nombre': serializer.toJson<String>(nombre),
      'posiciones': serializer.toJson<String>(posiciones),
      'estado': serializer.toJson<String>(estado),
      'valorPremio': serializer.toJson<double>(valorPremio),
      'acumula': serializer.toJson<String>(acumula),
      'carton': serializer.toJson<int>(carton),
      'idUsuario': serializer.toJson<int>(idUsuario),
    };
  }
}
