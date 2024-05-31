import 'package:vendedor_tienda/utils/json_serializer.dart';

class CartonesVendidosDTO {
  final String mensaje;
  final bool esVendido;
  final List<int> cartonesVendidos;
  final int idVenta;

  CartonesVendidosDTO(
      {required this.mensaje,
      required this.esVendido,
      required this.cartonesVendidos,
      required this.idVenta});

  factory CartonesVendidosDTO.fromJson(
      Map<String, dynamic> json, String mensaje) {
    var serializer = const JsonSerializer();

    List<dynamic> idCartonesJson = json['idCartonesVendidos'];
    List<int> idCartonesVendidos = [];
    for (var idcarton in idCartonesJson) {
      idCartonesVendidos.add(serializer.fromJson<int>(idcarton));
    }

    return CartonesVendidosDTO(
        mensaje: mensaje,
        esVendido: true,
        cartonesVendidos: idCartonesVendidos,
        idVenta: serializer.fromJson<int>(json['idVenta']));
  }

  CartonesVendidosDTO copyWith(
          {String? mensaje,
          bool? esVendido,
          List<int>? cartonesVendidos,
          int? idVenta}) =>
      CartonesVendidosDTO(
          mensaje: mensaje ?? this.mensaje,
          esVendido: esVendido ?? this.esVendido,
          cartonesVendidos: cartonesVendidos ?? this.cartonesVendidos,
          idVenta: idVenta ?? this.idVenta);
}
