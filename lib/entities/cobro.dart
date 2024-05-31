import 'package:vendedor_tienda/utils/json_serializer.dart';

class Cobro {
  final int idVendedorCobroCarton;
  final int idProgramacionJuego;
  final int idVendedor;
  final int totalCartones;
  final int cartonesDevueltos;
  final int numeroHojasEntregadas;
  final double porcentajeComision;
  final double totalVentas;
  final int cartonesCortesia;
  final double valorComision;
  final double abonos;
  final double totalPagado;
  final double faltante;
  final double totalRecibido;
  final double gastoCortesia;
  final double totalModulos;
  final String estado;
  final DateTime? fechaHora;
  final int idUsuario;
  final DateTime? fechaCobroApp;
  final DateTime? actualizado;

  Cobro({
    required this.idVendedorCobroCarton,
    required this.idProgramacionJuego,
    required this.idVendedor,
    required this.totalCartones,
    required this.cartonesDevueltos,
    required this.numeroHojasEntregadas,
    required this.porcentajeComision,
    required this.totalVentas,
    required this.cartonesCortesia,
    required this.valorComision,
    required this.abonos,
    required this.totalPagado,
    required this.faltante,
    required this.totalRecibido,
    required this.gastoCortesia,
    required this.totalModulos,
    required this.estado,
    this.fechaHora,
    required this.idUsuario,
    this.fechaCobroApp,
    this.actualizado,
  });

  factory Cobro.initial() {
    return Cobro(
        idVendedorCobroCarton: 0,
        idProgramacionJuego: 0,
        idVendedor: 0,
        totalCartones: 0,
        cartonesDevueltos: 0,
        numeroHojasEntregadas: 0,
        porcentajeComision: 0,
        totalVentas: 0,
        cartonesCortesia: 0,
        valorComision: 0,
        abonos: 0,
        totalPagado: 0,
        faltante: 0,
        totalRecibido: 0,
        gastoCortesia: 0,
        totalModulos: 0,
        estado: 'P',
        fechaHora: DateTime.now(),
        idUsuario: 0,
        fechaCobroApp: DateTime.now(),
        actualizado: DateTime.now());
  }

  factory Cobro.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Cobro(
      idVendedorCobroCarton: serializer.fromJson<int>(json['idCliente']),
      idProgramacionJuego: serializer.fromJson<int>(json['idCliente']),
      idVendedor: serializer.fromJson<int>(json['idCliente']),
      totalCartones: serializer.fromJson<int>(json['idCliente']),
      cartonesDevueltos: serializer.fromJson<int>(json['idCliente']),
      numeroHojasEntregadas: serializer.fromJson<int>(json['idCliente']),
      porcentajeComision: serializer.fromJson<double>(json['idCliente']),
      totalVentas: serializer.fromJson<double>(json['idCliente']),
      cartonesCortesia: serializer.fromJson<int>(json['idCliente']),
      valorComision: serializer.fromJson<double>(json['idCliente']),
      abonos: serializer.fromJson<double>(json['idCliente']),
      totalPagado: serializer.fromJson<double>(json['idCliente']),
      faltante: serializer.fromJson<double>(json['idCliente']),
      totalRecibido: serializer.fromJson<double>(json['idCliente']),
      gastoCortesia: serializer.fromJson<double>(json['idCliente']),
      totalModulos: serializer.fromJson<double>(json['idCliente']),
      estado: serializer.fromJson<String>(json['idCliente']),
      fechaHora: serializer.fromJson<DateTime>(json['idCliente']),
      idUsuario: serializer.fromJson<int>(json['idCliente']),
      fechaCobroApp: serializer.fromJson<DateTime>(json['idCliente']),
      actualizado: serializer.fromJson<DateTime>(json['idCliente']),
    );
  }

  Cobro copyWith({
    int? idVendedorCobroCarton,
    int? idProgramacionJuego,
    int? idVendedor,
    int? totalCartones,
    int? cartonesDevueltos,
    int? numeroHojasEntregadas,
    double? porcentajeComision,
    double? totalVentas,
    int? cartonesCortesia,
    double? valorComision,
    double? abonos,
    double? totalPagado,
    double? faltante,
    double? totalRecibido,
    double? gastoCortesia,
    double? totalModulos,
    String? estado,
    DateTime? fechaHora,
    int? idUsuario,
    DateTime? fechaCobroApp,
    DateTime? actualizado,
  }) {
    return Cobro(
      idVendedorCobroCarton:
          idVendedorCobroCarton ?? this.idVendedorCobroCarton,
      idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
      idVendedor: idVendedor ?? this.idVendedor,
      totalCartones: totalCartones ?? this.totalCartones,
      cartonesDevueltos: cartonesDevueltos ?? this.cartonesDevueltos,
      numeroHojasEntregadas:
          numeroHojasEntregadas ?? this.numeroHojasEntregadas,
      porcentajeComision: porcentajeComision ?? this.porcentajeComision,
      totalVentas: totalVentas ?? this.totalVentas,
      cartonesCortesia: cartonesCortesia ?? this.cartonesCortesia,
      valorComision: valorComision ?? this.valorComision,
      abonos: abonos ?? this.abonos,
      totalPagado: totalPagado ?? this.totalPagado,
      faltante: faltante ?? this.faltante,
      totalRecibido: totalRecibido ?? this.totalRecibido,
      gastoCortesia: gastoCortesia ?? this.gastoCortesia,
      totalModulos: totalModulos ?? this.totalModulos,
      estado: estado ?? this.estado,
      idUsuario: idUsuario ?? this.idUsuario,
      fechaHora: fechaHora ?? this.fechaHora,
      fechaCobroApp: fechaCobroApp ?? this.fechaCobroApp,
      actualizado: actualizado ?? this.actualizado,
    );
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idVendedorCobroCarton': serializer.toJson<int>(idVendedorCobroCarton),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'idVendedor': serializer.toJson<int>(idVendedor),
      'totalCartones': serializer.toJson<int>(totalCartones),
      'cartonesDevueltos': serializer.toJson<int>(cartonesDevueltos),
      'numeroHojasEntregadas': serializer.toJson<int>(numeroHojasEntregadas),
      'porcentajeComision': serializer.toJson<double>(porcentajeComision),
      'totalVentas': serializer.toJson<double>(totalVentas),
      'cartonesCortesia': serializer.toJson<int>(cartonesCortesia),
      'valorComision': serializer.toJson<double>(valorComision),
      'abonos': serializer.toJson<double>(abonos),
      'totalPagado': serializer.toJson<double>(totalPagado),
      'faltante': serializer.toJson<double>(faltante),
      'totalRecibido': serializer.toJson<double>(totalRecibido),
      'gastoCortesia': serializer.toJson<double>(gastoCortesia),
      'totalModulos': serializer.toJson<double>(totalModulos),
      'estado': serializer.toJson<String>(estado),
      'fechaHora': serializer.toJson<DateTime?>(fechaHora),
      'idUsuario': serializer.toJson<int>(idUsuario),
      'fechaCobroApp': serializer.toJson<DateTime?>(fechaCobroApp),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }
}
