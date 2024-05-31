import 'package:vendedor_tienda/entities/venta_detalle.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class Venta {
  final int idVenta;
  final int idVendedor;
  final int idSucursal;
  final int totalCartones;
  final int totalVenta;
  final String nombreCliente;
  final String? correoCliente;
  final String? telefonoCliente;
  final DateTime fecha;
  final String estado;
  final List<VentaDetalle> listVentaDetalles;
  final String? observaciones;

  Venta({
    required this.idVenta,
    required this.idVendedor,
    required this.idSucursal,
    required this.totalCartones,
    required this.totalVenta,
    required this.nombreCliente,
    this.correoCliente,
    this.telefonoCliente,
    required this.fecha,
    required this.estado,
    required this.listVentaDetalles,
    this.observaciones,
  });

  factory Venta.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var lisVentaDetalle = VentaDetalle.fromListJson(json['listVentaDetalles']);

    return Venta(
      idVenta: serializer.fromJson<int>(json['idVenta']),
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      idSucursal: serializer.fromJson<int>(json['idSucursal']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      totalVenta: serializer.fromJson<int>(json['totalVenta']),
      nombreCliente: serializer.fromJson<String>(json['nombreCliente']),
      correoCliente: serializer.fromJson<String?>(json['correoCliente']),
      telefonoCliente: serializer.fromJson<String?>(json['telefonoCliente']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      estado: serializer.fromJson<String>(json['estado']),
      listVentaDetalles: lisVentaDetalle,
      observaciones: serializer.fromJson<String?>(json['observaciones']),
    );
  }

  static List<Venta> fromListJson(List<dynamic> ventasJson) {
    List<Venta> listDTO = [];

    for (var ventaJson in ventasJson) {
      Venta juego = Venta.fromJson(ventaJson);
      listDTO.add(juego);
    }
    return listDTO;
  }
}
