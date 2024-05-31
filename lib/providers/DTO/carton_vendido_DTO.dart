import 'package:vendedor_tienda/utils/json_serializer.dart';

class CartonVendidoDTO {
  final int idCarton;
  final bool esVendido;

  CartonVendidoDTO({
    required this.idCarton,
    required this.esVendido,
  });

  factory CartonVendidoDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return CartonVendidoDTO(
      idCarton: serializer.fromJson<int>(json['idCarton']),
      esVendido: serializer.fromJson<bool>(json['esVendido']),
    );
  }

  static List<CartonVendidoDTO> fromListJson(
      List<dynamic> cartonesVendidosJson) {
    List<CartonVendidoDTO> cartonesDTO = [];

    for (var cartoneVendidoJson in cartonesVendidosJson) {
      CartonVendidoDTO carton = CartonVendidoDTO.fromJson(cartoneVendidoJson);
      cartonesDTO.add(carton);
    }
    return cartonesDTO;
  }
}
