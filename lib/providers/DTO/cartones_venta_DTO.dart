import 'package:vendedor_tienda/utils/json_serializer.dart';

class CartonesVentaDTO {
  final int idProgramacionJuego;
  final List<int> idsCartones;

  CartonesVentaDTO({
    required this.idProgramacionJuego,
    required this.idsCartones,
  });

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'IdProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'IdsCartones': serializer.toJson<List<int>>(idsCartones),
    };
  }
}
