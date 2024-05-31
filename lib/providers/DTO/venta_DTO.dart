import 'package:vendedor_tienda/providers/DTO/venta_detalle_DTO.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class VentaDTO {
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
  final List<VentaDetalleDTO> listVentaDetalles;
  final String? observaciones;

  VentaDTO({
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

  factory VentaDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var lisVentaDetalle =
        VentaDetalleDTO.fromListJson(json['listVentaDetalles']);

    return VentaDTO(
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

  static List<VentaDTO> fromListJson(List<dynamic> ventasJson) {
    List<VentaDTO> listDTO = [];

    for (var ventaJson in ventasJson) {
      VentaDTO juego = VentaDTO.fromJson(ventaJson);
      listDTO.add(juego);
    }
    return listDTO;
  }
}
