import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/providers/api.dart';
import 'package:vendedor_tienda/providers/result.dart';

class JuegoRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  ResultApi result = ResultApi(isSucess: false);
  Respuesta respuesta = Respuesta(false, 'Error');

  Future<Respuesta<List<Juego>>> allJuegos(String estado) async {
    var resp = Respuesta<List<Juego>>(false, 'Error');
    try {
      result = await api.getData('juegostienda', {});
    } catch (e) {
      return resp.copyWith(message: 'Error al obtener Juegos');
    }

    if (result.isSucess) {
      return resp.copyWith(
          ok: true, info: Juego.fromListJson(result.data, estado));
    } else {
      return resp.copyWith(ok: false, message: result.data['mensaje']);
    }
  }

  Future<Juego> selectJuego(Juego juego) async {
    return juego;
  }
}
