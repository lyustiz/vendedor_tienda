import 'package:vendedor_tienda/entities/usuario.dart';

class ResultLogin {
  final bool isLogged;
  final bool isSync;
  final String? message;
  final Usuario? usuario;
  ResultLogin(
      {required this.isLogged,
      required this.isSync,
      this.message,
      this.usuario});
}

class ResultApi {
  bool isSucess;
  dynamic data;
  ResultApi({required this.isSucess, this.data});
}

class Respuesta<T> {
  bool ok;
  String message;
  T? info;

  Respuesta(this.ok, this.message, {this.info});

  Respuesta<T> copyWith({bool? ok, String? message, T? info}) {
    return Respuesta(ok ?? this.ok, message ?? this.message,
        info: info ?? this.info);
  }

  void respuestaOk(T info, {mensaje}) {
    this.ok = true;
    this.info = info;
    this.message = mensaje ?? this.message;
  }

  void respuestaError(String mensaje) {
    this.ok = false;
    this.message = mensaje;
  }
}
