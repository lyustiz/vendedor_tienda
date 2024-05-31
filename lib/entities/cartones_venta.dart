import 'package:vendedor_tienda/utils/json_serializer.dart';

class CartonesVenta {
  final int idProgramacionJuego;
  final List<int> idsCartones;

  CartonesVenta({
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
