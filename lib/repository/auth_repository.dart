import 'package:vendedor_tienda/entities/usuario.dart';
import 'package:vendedor_tienda/providers/result.dart';

import 'package:vendedor_tienda/providers/api.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendedor_tienda/utils/crypt_helper.dart' as crypt;

class AuthRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  ResultApi result = ResultApi(isSucess: false);
  Respuesta respuesta = Respuesta(false, 'Error');

  Future<ResultLogin> login(
      {required String usuario, required String password}) async {
    var apilogin = await apiLogin(usuario: usuario, password: password);
    return ResultLogin(
        isLogged: apilogin.isLogged,
        isSync: false,
        message: apilogin.message,
        usuario: apilogin.usuario);
  }

  Future<ResultLogin> apiLogin(
      {required String usuario,
      required String password,
      bool usuarioExiste = false,
      String tipoUsuario = 'SU'}) async {
    var params = {
      'usuario': usuario,
      'password': crypt.encryp(password),
      'tipoUsuario': tipoUsuario
    };

    var result =
        await api.postData('login/authenticate', params: params, isAuth: true);

    if (result.isSucess) {
      Map<String, dynamic> userdata = result.data;
      userdata['password'] = crypt.encryp(password);
      userdata['fechaIngreso'] = userdata['actualizado'];
      Usuario usuario = Usuario.fromJson(userdata);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('idUsuario', usuario.idUsuario);
      await prefs.setString('nombre', usuario.nombres);

      return ResultLogin(isLogged: true, isSync: false, usuario: usuario);
    }

    return ResultLogin(
        isLogged: false,
        isSync: false,
        message: (result.data == null) ? 'error' : result.data["message"]);
  }

  Future<Respuesta> recuperarPassword(Usuario usuario) async {
    var params = {"tipoUsuario": 'SU', "documento": usuario.documento};
    try {
      result = await api.postData('login/recoverpassword', params: params);
    } catch (e) {
      respuesta.message += ': $e';
      return respuesta;
    }

    return respuesta.copyWith(
        ok: result.isSucess,
        message: result.data['message'] ?? result.data['mensaje']);
  }

  Future<Respuesta> cambioPassword(Usuario usuario) async {
    var params = {
      "password": usuario.password,
      "passwordVerify": usuario.passwordVerify,
      "tipoUsuario": "SU",
      "documento": usuario.documento,
      "token": usuario.token
    };

    try {
      result = await api.postData('login/updatepassword', params: params);
    } catch (e) {
      respuesta.message += ': $e';
      return respuesta;
    }

    return respuesta.copyWith(
        ok: result.isSucess,
        message: result.data['message'] ?? result.data['mensaje']);
  }
}

Future<bool> logout() async {
  return true;
}
