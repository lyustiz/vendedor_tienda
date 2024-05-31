import 'package:vendedor_tienda/entities/cobro.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class CobroDTO {
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
  final String fechaHora;
  final int idUsuario;
  final String fechaCobroApp;

  CobroDTO({
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
    required this.fechaHora,
    required this.idUsuario,
    required this.fechaCobroApp,
  });

  factory CobroDTO.fromCobro(Cobro cobro, {required int idVendedor}) {
    return CobroDTO(
      idVendedorCobroCarton: cobro.idVendedorCobroCarton,
      idProgramacionJuego: cobro.idProgramacionJuego,
      idVendedor: idVendedor,
      totalCartones: cobro.totalCartones,
      cartonesDevueltos: cobro.cartonesDevueltos,
      numeroHojasEntregadas: cobro.numeroHojasEntregadas,
      porcentajeComision: cobro.porcentajeComision,
      totalVentas: cobro.totalVentas,
      cartonesCortesia: cobro.cartonesCortesia,
      valorComision: cobro.valorComision,
      abonos: cobro.abonos,
      totalPagado: cobro.totalPagado,
      faltante: cobro.faltante,
      totalRecibido: cobro.totalRecibido,
      gastoCortesia: cobro.gastoCortesia,
      totalModulos: cobro.totalModulos,
      estado: cobro.estado,
      fechaHora: cobro.fechaHora!.toIso8601String(),
      idUsuario: cobro.idUsuario,
      fechaCobroApp: cobro.fechaCobroApp!.toIso8601String(),
    );
  }

  static Cobro toCobro(CobroDTO cobroDTO) {
    return Cobro(
      idVendedorCobroCarton: cobroDTO.idVendedorCobroCarton,
      idProgramacionJuego: cobroDTO.idProgramacionJuego,
      idVendedor: cobroDTO.idVendedor,
      totalCartones: cobroDTO.totalCartones,
      cartonesDevueltos: cobroDTO.cartonesDevueltos,
      numeroHojasEntregadas: cobroDTO.numeroHojasEntregadas,
      porcentajeComision: cobroDTO.porcentajeComision,
      totalVentas: cobroDTO.totalVentas,
      cartonesCortesia: cobroDTO.cartonesCortesia,
      valorComision: cobroDTO.valorComision,
      abonos: cobroDTO.abonos,
      totalPagado: cobroDTO.totalPagado,
      faltante: cobroDTO.faltante,
      totalRecibido: cobroDTO.totalRecibido,
      gastoCortesia: cobroDTO.gastoCortesia,
      totalModulos: cobroDTO.totalModulos,
      estado: cobroDTO.estado,
      fechaHora: DateTime.parse(cobroDTO.fechaHora),
      idUsuario: cobroDTO.idUsuario,
      fechaCobroApp: DateTime.parse(cobroDTO.fechaCobroApp),
    );
  }

  static List<CobroDTO> fromListCartones(List<Cobro> cobros,
      {required int idVendedor}) {
    List<CobroDTO> cobrosDTO = [];

    for (var cobro in cobros) {
      cobrosDTO.add(CobroDTO.fromCobro(cobro, idVendedor: idVendedor));
    }

    return cobrosDTO;
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
      'fechaHora': serializer.toJson<String>(fechaHora),
      'idUsuario': serializer.toJson<int>(idUsuario),
      'fechaCobroApp': serializer.toJson<String>(fechaCobroApp),
    };
  }

  factory CobroDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return CobroDTO(
      idVendedorCobroCarton:
          serializer.fromJson<int>(json['idVendedorCobroCarton']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idVendedor: serializer.fromJson<int>(json['idVendedor']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      cartonesDevueltos: serializer.fromJson<int>(json['cartonesDevueltos']),
      numeroHojasEntregadas:
          serializer.fromJson<int>(json['numeroHojasEntregadas']),
      porcentajeComision:
          serializer.fromJson<double>(json['porcentajeComision']),
      totalVentas: serializer.fromJson<double>(json['totalVentas']),
      cartonesCortesia: serializer.fromJson<int>(json['cartonesCortesia']),
      valorComision: serializer.fromJson<double>(json['valorComision']),
      abonos: serializer.fromJson<double>(json['abonos']),
      totalPagado: serializer.fromJson<double>(json['totalPagado']),
      faltante: serializer.fromJson<double>(json['faltante']),
      totalRecibido: serializer.fromJson<double>(json['totalRecibido']),
      gastoCortesia: serializer.fromJson<double>(json['gastoCortesia']),
      totalModulos: serializer.fromJson<double>(json['totalModulos']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaHora: serializer.fromJson<String>(json['fechaHora']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      fechaCobroApp: serializer.fromJson<String>(json['fechaCobroApp']),
    );
  }
}
