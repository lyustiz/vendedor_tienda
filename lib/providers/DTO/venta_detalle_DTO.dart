import 'package:vendedor_tienda/utils/json_serializer.dart';

import 'carton_DTO.dart';

class VentaDetalleDTO {
  final int idVentaDetalle;
  final int idVenta;
  final int idCarton;
  final String estado;
  final CartonDTO carton;

  VentaDetalleDTO(
      {required this.idVentaDetalle,
      required this.idVenta,
      required this.idCarton,
      required this.estado,
      required this.carton});

  factory VentaDetalleDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var carton = CartonDTO.fromJson(json['carton']);
    return VentaDetalleDTO(
        idVentaDetalle: serializer.fromJson<int>(json['idVentaDetalle']),
        idVenta: serializer.fromJson<int>(json['idVenta']),
        idCarton: serializer.fromJson<int>(json['idCarton']),
        estado: serializer.fromJson<String>(json['estado']),
        carton: carton);
  }

  static List<VentaDetalleDTO> fromListJson(List<dynamic> ventasJson) {
    List<VentaDetalleDTO> listDTO = [];

    for (var ventaJson in ventasJson) {
      VentaDetalleDTO juego = VentaDetalleDTO.fromJson(ventaJson);

      listDTO.add(juego);
    }

    return listDTO;
  }
}
