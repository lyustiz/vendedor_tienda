import 'package:vendedor_tienda/providers/DTO/venta_DTO.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class ResumenVentaDTO {
  final int idProgramacionJuego;
  final int idVendedor;
  final List<VentaDTO> listVentas;
  final int sumCartonesVendidos;
  final double sumTotalVentas;
  final bool poseeCobro;
  final bool estaCerrado;
  final bool esError;
  final String? errorMsj;

  ResumenVentaDTO({
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

  factory ResumenVentaDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();

    var lisVentas = VentaDTO.fromListJson(json['listVentas']);

    return ResumenVentaDTO(
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

  factory ResumenVentaDTO.esError(String errorMsj) {
    return ResumenVentaDTO(
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
