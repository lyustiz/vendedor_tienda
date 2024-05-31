import 'package:vendedor_tienda/entities/solicitud.dart';
import 'package:vendedor_tienda/providers/api.dart';
import 'package:vendedor_tienda/providers/result.dart';

class SolicitudRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  ResultApi result = ResultApi(isSucess: false);
  Respuesta respuesta = Respuesta(false, 'Error');

  Future<Respuesta<List<Solicitud>>> allSolicitudes(
      int idProgramacionJuego) async {
    var params = {'IdProgramacionJuego': '$idProgramacionJuego', 'Estado': 'A'};

    var resp = Respuesta<List<Solicitud>>(false, 'Error');
    try {
      result = await api.getData('solicitudesvendedores', params);
    } catch (e) {
      return resp.copyWith(message: 'Error al obtener Juegos');
    }

    if (result.isSucess) {
      return resp.copyWith(ok: true, info: Solicitud.fromListJson(result.data));
    }
    return resp.copyWith(ok: false, message: result.data['mensaje']);
  }

  Future<Respuesta<List<Solicitud>>> solicitudesJuego(
      int idProgramacionJuego) async {
    var resp = Respuesta<List<Solicitud>>(false, 'Error');
    try {
      result =
          await api.getData('solicitudesvendedores/$idProgramacionJuego', {});
    } catch (e) {
      return resp.copyWith(message: 'Error al obtener Juegos');
    }

    if (result.isSucess) {
      return resp.copyWith(ok: true, info: Solicitud.fromListJson(result.data));
    }
    return resp.copyWith(
        ok: false, message: result.data['mensaje'] ?? result.data['message']);
  }

  Future<Respuesta<Solicitud>> insertSolicitud(Solicitud solicitud) async {
    var resp = Respuesta<Solicitud>(false, 'Error');
    try {
      Map<String, dynamic> json = solicitud.toJson();
      result = await api.postData('solicitudesvendedores', params: json);
    } catch (e) {
      return resp.copyWith(message: 'Error al crear Solicitud');
    }

    if (result.isSucess) {
      return resp.copyWith(ok: true, info: Solicitud.fromJson(result.data));
    }
    return resp.copyWith(
        ok: false, message: result.data['mensaje'] ?? result.data['message']);
  }
}
