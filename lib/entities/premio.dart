import 'package:vendedor_tienda/utils/json_serializer.dart';

class Premio {
  final int idPremio;
  final int idPlenoAutomatico;
  final String nombre;
  final String posiciones;
  final String estado;
  final double valorPremio;
  final DateTime? actualizado;
  Premio({
    required this.idPremio,
    required this.idPlenoAutomatico,
    required this.nombre,
    required this.posiciones,
    required this.estado,
    required this.valorPremio,
    this.actualizado,
  });

  factory Premio.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Premio(
      idPremio: serializer.fromJson<int>(json['idFigura']),
      idPlenoAutomatico: serializer.fromJson<int>(json['idPlenoAutomatico']),
      nombre: serializer.fromJson<String>(json['nombre']),
      posiciones: serializer.fromJson<String>(json['posiciones']),
      estado: serializer.fromJson<String>(json['estado']),
      valorPremio: serializer.fromJson<double>(json['valorPremio']),
      actualizado: serializer.fromJson<DateTime?>(json['"fechaAjuste"']),
    );
  }

  static List<Premio> fromListJson(List<dynamic> premiosJson) {
    List<Premio> premios = [];

    for (var premioJson in premiosJson) {
      Premio premio = Premio.fromJson(premioJson);
      premios.add(premio);
    }
    return premios;
  }
}
