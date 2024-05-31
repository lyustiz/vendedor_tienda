import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class CartonesBloqueadosDTO {
  final String mensaje;
  final bool esBloqueado;
  final List<int> idCartonesValidos;
  final List<Carton> cartones;

  CartonesBloqueadosDTO(
      {required this.mensaje,
      required this.esBloqueado,
      required this.idCartonesValidos,
      required this.cartones});

  factory CartonesBloqueadosDTO.fromJson(
      Map<String, dynamic> json, List<Carton> cartones) {
    var serializer = const JsonSerializer();

    List<dynamic> idCartonesJson = json['idCartonesValidos'];
    List<int> idCartonesValidos = [];
    for (var idcarton in idCartonesJson) {
      idCartonesValidos.add(serializer.fromJson<int>(idcarton));
    }

    return CartonesBloqueadosDTO(
        mensaje: serializer.fromJson<String>(json['mensaje']),
        esBloqueado: serializer.fromJson<bool>(json['esBloqueado']),
        idCartonesValidos: idCartonesValidos,
        cartones: cartones);
  }
}
