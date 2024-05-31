import 'dart:io';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendedor_tienda/providers/custom_exeption.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/preferences_repository_impl.dart';

class Api {
  final String prefix;

  late Uri url;
  late String baseUrl;
  http.Response? response;
  bool isSucess = false;
  dynamic data;
  int timeOut = 60;

  Map<String, String> headers = {
    'Authorization': '',
    "Content-type": "application/json"
  };

  Api({this.prefix = '/api/v1/'});

  Future<ResultApi> getData(
      String endPoint, Map<String, dynamic>? params) async {
    baseUrl = await getEndPoint();
    url = Uri.https(baseUrl, prefix + endPoint, params);

    headers['Authorization'] = '${await getToken()}';

    response = await http
        .get(url, headers: headers)
        .timeout(Duration(seconds: timeOut))
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      errorHandler(e);
    });

    return decodeResponse(response);
  }

  Future<ResultApi> postData(String endPoint,
      {Map<String, dynamic>? params, bool isAuth = false}) async {
    baseUrl = await getEndPoint();
    url = Uri.https(baseUrl, prefix + endPoint);

    if (!isAuth) {
      headers['Authorization'] = '${await getToken()}';
    }

    var body = convert.jsonEncode(params);

    response = await http
        .post(url, body: body, headers: headers)
        .timeout(Duration(seconds: timeOut))
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      errorHandler(e);
    });

    await setToken(response, isAuth);

    return decodeResponse(response);
  }

  Future<ResultApi> postDataList(String endPoint,
      {List? params, bool isAuth = false}) async {
    baseUrl = await getEndPoint();
    url = Uri.https(baseUrl, prefix + endPoint);

    if (!isAuth) {
      headers['Authorization'] = '${await getToken()}';
    }

    var body = convert.jsonEncode(params);

    response = await http
        .post(url, body: body, headers: headers)
        .timeout(Duration(seconds: timeOut))
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      errorHandler(e);
    });

    await setToken(response, isAuth);
    return decodeResponse(response);
  }

  Future<ResultApi> putDataList(String endPoint,
      {List? params, bool isAuth = false}) async {
    baseUrl = await getEndPoint();
    url = Uri.https(baseUrl, prefix + endPoint);

    if (!isAuth) {
      headers['Authorization'] = '${await getToken()}';
    }

    var body = convert.jsonEncode(params);

    response = await http
        .put(url, body: body, headers: headers)
        .timeout(Duration(seconds: timeOut))
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      errorHandler(e);
    });

    await setToken(response, isAuth);
    return decodeResponse(response);
  }

  Future<ResultApi> putData(String endPoint, Map<String, dynamic> params,
      {bool isAuth = false}) async {
    baseUrl = await getEndPoint();
    url = Uri.https(baseUrl, prefix + endPoint);

    if (!isAuth) {
      headers['Authorization'] = '${await getToken()}';
      headers['Content-Type'] = "application/json; charset=utf-8";
    }

    var body = convert.jsonEncode(params);

    response = await http
        .put(url, body: body, headers: headers)
        .timeout(Duration(seconds: timeOut))
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      errorHandler(e);
    });

    return decodeResponse(response);
  }

  Future<ResultApi> deleteData(
      String endPoint, Map<String, dynamic> params) async {
    baseUrl = await getEndPoint();
    url = Uri.https(baseUrl, endPoint);

    headers['Authorization'] = '${await getToken()}';

    response = await http
        .delete(url, headers: headers)
        .timeout(Duration(seconds: timeOut))
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      errorHandler(e);
    });

    return decodeResponse(response);
  }

  ResultApi decodeResponse(http.Response? response) {
    if (response is http.Response) {
      if (response.statusCode == 200) {
        data = convert.jsonDecode(response.body);
        isSucess = true;
      } else {
        isSucess = false;
        data = {
          'code': response.statusCode,
          'message': errorMessage(response.statusCode, response.body),
          'body':
              (response.body == '') ? null : convert.jsonDecode(response.body)
        };
      }
    }

    return ResultApi(isSucess: isSucess, data: data);
  }

  String errorMessage(int codeError, String body) {
    Map<int, String> messages = {
      401: 'Credenciales Invalidas',
      403: 'No autorizado',
      404: 'No encontrado',
      405: 'Solicitud Invalida',
      500: 'Problemas en el servidor',
      502: 'Servidor no Disponible'
    };

    if (codeError == 409) {
      var data = convert.jsonDecode(body);
      return data['message'] ?? data['mensaje'];
    }

    return messages[codeError] ?? 'Error $codeError';
  }

  void errorHandler(Exception e) {
    if (e is SocketException) {
      throw FetchDataException('Sin Conexion a Internet');
    }
    if (e is TimeoutException) {
      throw FetchDataException('Tiempo de conexion excedido');
    }
    throw FetchDataException('Error en conexion');
  }

  Future<bool> setToken(http.Response? response, bool isAuth) async {
    if (response is http.Response) {
      if ((response.statusCode == 200) & (isAuth)) {
        String token = 'Bearer ${response.headers['authorization']}';
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }
    }

    return true;
  }

  Future<String> getEndPoint() async {
    PreferenceRepositoryImpl rep = PreferenceRepositoryImpl();
    return await rep.getEndPoint();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }

  Future<bool> checkConnect() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
