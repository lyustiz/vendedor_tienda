import 'package:vendedor_tienda/entities/venta.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class ResumenVenta {
  final int idProgramacionJuego;
  final int idVendedor;
  final List<Venta> listVentas;
  final int sumCartonesVendidos;
  final double sumTotalVentas;
  final bool poseeCobro;
  final bool estaCerrado;
  final bool esError;
  final String? errorMsj;

  ResumenVenta({
    required this.idProgramacionJuego,
    required this.idVendedor,
    required this.listVentas,
    required this.sumCartonesVendidos,
    required this.sumTotalVentas,
    required this.poseeCobro,
    required this.estaCerrado,
    required this.esError,
    this.errorMsj,
  });

  factory ResumenVenta.initial() => ResumenVenta(
      idProgramacionJuego: 0,
      idVendedor: 0,
      listVentas: [],
      sumCartonesVendidos: 0,
      sumTotalVentas: 0,
      poseeCobro: false,
      estaCerrado: false,
      esError: false);

  factory ResumenVenta.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var lisVentas = Venta.fromListJson(json['listVentas']);

    return ResumenVenta(
        idProgramacionJuego:
            serializer.fromJson<int>(json['idProgramacionJuego']),
        idVendedor: serializer.fromJson<int>(json['idVendedor']),
        listVentas: lisVentas,
        sumCartonesVendidos:
            serializer.fromJson<int>(json['sumCartonesVendidos']),
        sumTotalVentas: serializer.fromJson<double>(json['sumTotalVentas']),
        poseeCobro: serializer.fromJson<bool>(json['poseeCobro']),
        estaCerrado: serializer.fromJson<bool>(json['estaCerrado']),
        esError: false);
  }

  factory ResumenVenta.esError(String errorMsj) {
    return ResumenVenta(
        idProgramacionJuego: 0,
        idVendedor: 0,
        listVentas: [],
        sumCartonesVendidos: 0,
        sumTotalVentas: 0,
        poseeCobro: false,
        estaCerrado: false,
        esError: true,
        errorMsj: errorMsj);
  }
}
