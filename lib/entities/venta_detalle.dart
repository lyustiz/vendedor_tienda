import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class VentaDetalle {
  final int idVentaDetalle;
  final int idVenta;
  final int idCarton;
  final String estado;
  final Carton carton;

  VentaDetalle(
      {required this.idVentaDetalle,
      required this.idVenta,
      required this.idCarton,
      required this.estado,
      required this.carton});

  factory VentaDetalle.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var carton = Carton.fromJsonResumen(json['carton']);
    return VentaDetalle(
        idVentaDetalle: serializer.fromJson<int>(json['idVentaDetalle']),
        idVenta: serializer.fromJson<int>(json['idVenta']),
        idCarton: serializer.fromJson<int>(json['idCarton']),
        estado: serializer.fromJson<String>(json['estado']),
        carton: carton);
  }

  static List<VentaDetalle> fromListJson(List<dynamic> ventasJson) {
    List<VentaDetalle> listDTO = [];

    for (var ventaJson in ventasJson) {
      VentaDetalle juego = VentaDetalle.fromJson(ventaJson);

      listDTO.add(juego);
    }

    return listDTO;
  }
}
