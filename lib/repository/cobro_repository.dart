import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendedor_tienda/entities/cobro.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/providers/api.dart';

class CobroRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  ResultApi result = ResultApi(isSucess: false);
  Respuesta respuesta = Respuesta(false, 'Error');

  // **************************
  Future<Respuesta<Cobro>> selectCobroJuego(int idProgramacionJuego) async {
    var params = {"idProgramacionJuego": idProgramacionJuego};
    Respuesta<Cobro> respuesta = Respuesta<Cobro>(false, 'Error');

    try {
      result = await api.getData('cobrocartones', params);
    } catch (e) {
      return respuesta.copyWith(message: 'Error al obtener cobro');
    }
    if (result.isSucess) {
      return respuesta.copyWith(ok: true, info: Cobro.fromJson(result.data));
    }
    return Respuesta(result.isSucess, result.data);
  }

  Future<Respuesta<Cobro>> insertCobro(int idProgramacionJuego) async {
    final prefs = await SharedPreferences.getInstance();
    final idUsuario = prefs.getInt('idUsuario');
    Respuesta<Cobro> respuesta = Respuesta<Cobro>(false, 'Error');

    Cobro cobro = Cobro.initial().copyWith(
        idProgramacionJuego: idProgramacionJuego, idUsuario: idUsuario!);

    try {
      result = await api.postData('cobrocartones', params: cobro.toJson());
    } catch (e) {
      return respuesta.copyWith(message: 'Error an insertar cobro');
    }

    return Respuesta(
        result.isSucess, result.data['message'] ?? result.data['mensaje']);
  }
}
