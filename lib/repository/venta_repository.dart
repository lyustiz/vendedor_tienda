import 'package:vendedor_tienda/entities/estadistica.dart';
import 'package:vendedor_tienda/entities/resumen_venta.dart';
import 'package:vendedor_tienda/providers/api.dart';
import 'package:vendedor_tienda/providers/result.dart';

class VentaRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  ResultApi result = ResultApi(isSucess: false);
  Respuesta respuesta = Respuesta(false, 'Error');

  Future<Respuesta<ResumenVenta>> getResumenVenta(
      int idProgramacionJuego) async {
    var params = {'idProgramacionJuego': '$idProgramacionJuego'};

    var resp = Respuesta<ResumenVenta>(false, 'Error');
    try {
      result = await api.getData('resumenventatienda', params);
    } catch (e) {
      return resp.copyWith(message: 'Error al obtener Ventas');
    }

    if (result.isSucess) {
      return resp.copyWith(ok: true, info: ResumenVenta.fromJson(result.data));
    } else {
      return resp.copyWith(
          ok: false, message: result.data['mensaje'] ?? result.data['message']);
    }
  }

  Future<Respuesta<Estadistica>> getEstadisticaVenta(
      int idProgramacionJuego) async {
    var resp = Respuesta<Estadistica>(false, 'Error');
    try {
      result = await api
          .getData('resumenventatienda/estadistica/$idProgramacionJuego', {});
    } catch (e) {
      return resp.copyWith(message: 'Error al obtener Estadisticas');
    }

    if (result.isSucess) {
      return resp.copyWith(ok: true, info: Estadistica.fromJson(result.data));
    } else {
      return resp.copyWith(
          ok: false, message: result.data['mensaje'] ?? result.data['message']);
    }
  }
}
