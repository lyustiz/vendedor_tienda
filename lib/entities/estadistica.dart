import 'package:vendedor_tienda/utils/json_serializer.dart';

class Estadistica {
  final int idProgramacionJuego;
  final int idVendedor;
  final int idSucursal;
  final int totalCartones;
  final int cartonesVendidos;
  final int cantidadVentas;
  final double totalVentas;
  final bool cobrado;

  Estadistica({
    required this.idProgramacionJuego,
    required this.idVendedor,
    required this.idSucursal,
    required this.totalCartones,
    required this.cartonesVendidos,
    required this.cantidadVentas,
    required this.totalVentas,
    required this.cobrado,
  });

  factory Estadistica.initial() => Estadistica(
      idProgramacionJuego: 0,
      idVendedor: 0,
      idSucursal: 0,
      totalCartones: 0,
      cartonesVendidos: 0,
      cantidadVentas: 0,
      totalVentas: 0,
      cobrado: false);

  factory Estadistica.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Estadistica(
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      idSucursal: serializer.fromJson<int>(json['idSucursal']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      cartonesVendidos: serializer.fromJson<int>(json['cartonesVendidos']),
      cantidadVentas: serializer.fromJson<int>(json['cantidadVentas']),
      totalVentas: serializer.fromJson<double>(json['totalVentas']),
      cobrado: serializer.fromJson<bool>(json['cobrado']),
    );
  }
}
 /* final int idProgramacionJuego;
  final int idVendedor;
  final int totalCartones;
  final int cartonesVendidos;
  final int cartonesCortesia;
  final double valorTotal;
  final double totalRecibido;
  final double valorPendiente;
  final int cartonesDevueltos;
  final int numeroHojasDevueltas;
  final double porcentajeComision;
  final double valorComision;
  final bool cobrado;
  final double faltante;
  final double gastoCortesia;
  final int cantidadModulos;
  final double valorModulos;
  final String estado;

  Estadistica({
    required this.idProgramacionJuego,
    required this.idVendedor,
    required this.totalCartones,
    required this.cartonesVendidos,
    required this.cartonesCortesia,
    required this.valorTotal,
    required this.totalRecibido,
    required this.valorPendiente,
    required this.cartonesDevueltos,
    required this.numeroHojasDevueltas,
    required this.porcentajeComision,
    required this.valorComision,
    required this.cobrado,
    required this.faltante,
    required this.gastoCortesia,
    required this.cantidadModulos,
    required this.valorModulos,
    required this.estado,
  });

  factory Estadistica.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Estadistica(
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      cartonesVendidos: serializer.fromJson<int>(json['cartonesVendidos']),
      cartonesCortesia: serializer.fromJson<int>(json['cartonesCortesia']),
      valorTotal: serializer.fromJson<double>(json['valorTotal']),
      totalRecibido: serializer.fromJson<double>(json['totalRecibido']),
      valorPendiente: serializer.fromJson<double>(json['valorPendiente']),
      cartonesDevueltos: serializer.fromJson<int>(json['cartonesDevueltos']),
      numeroHojasDevueltas:
          serializer.fromJson<int>(json['numeroHojasDevueltas']),
      porcentajeComision:
          serializer.fromJson<double>(json['porcentajeComision']),
      valorComision: serializer.fromJson<double>(json['valorComision']),
      cobrado: serializer.fromJson<bool>(json['cobrado']),
      faltante: serializer.fromJson<double>(json['faltante']),
      gastoCortesia: serializer.fromJson<double>(json['gastoCortesia']),
      cantidadModulos: serializer.fromJson<int>(json['cantidadModulos']),
      valorModulos: serializer.fromJson<double>(json['valorModulos']),
      estado: serializer.fromJson<String>(json['estado']),
    );
  }
}*/

/*


class Estadistica {
  final int idProgramacionJuego;
  final int valorCarton;
  final int valorModulo;
  final int ventaCartones;
  final int totalCartones;
  final int totalVentaCartones;
  final int ventaModulos;
  final int totalModulos;
  final int totalVentaModulos;
  final int ventaPromocion;
  final int totalMontoVenta;

  Estadistica({
    required this.idProgramacionJuego,
    required this.valorCarton,
    required this.valorModulo,
    required this.ventaCartones,
    required this.totalCartones,
    required this.totalVentaCartones,
    required this.ventaModulos,
    required this.totalModulos,
    required this.totalVentaModulos,
    required this.ventaPromocion,
    required this.totalMontoVenta,
  });

  @override
  String toString() {
    return 'Estadistica $Estadistica';
  }
}

*/
