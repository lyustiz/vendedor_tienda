import 'package:vendedor_tienda/utils/json_serializer.dart';

class Usuario {
  final int idUsuario;
  final int? codigo;
  final String nombres;
  final String? apellidos;
  final String documento;
  final String celular;
  final String password;
  final String? passwordVerify;
  final String estado;
  final String? token;
  final DateTime? fechaCreacion;
  final DateTime? fechaIngreso;
  final DateTime? actualizado;

  Usuario(
      {required this.idUsuario,
      this.codigo,
      required this.nombres,
      this.apellidos,
      required this.documento,
      required this.celular,
      required this.password,
      this.passwordVerify,
      required this.estado,
      this.token,
      this.fechaCreacion,
      this.fechaIngreso,
      this.actualizado});

  factory Usuario.initial() => Usuario(
      idUsuario: 0,
      nombres: '',
      documento: '',
      celular: '',
      password: '',
      estado: 'A');

  Usuario copyWith(
      {int? idUsuario,
      int? codigo,
      String? nombres,
      String? apellidos,
      String? documento,
      String? celular,
      String? password,
      String? passwordVerify,
      String? estado,
      String? token,
      DateTime? fechaCreacion,
      DateTime? fechaIngreso,
      DateTime? actualizado}) {
    return Usuario(
        idUsuario: idUsuario ?? this.idUsuario,
        codigo: codigo ?? this.codigo,
        nombres: nombres ?? this.nombres,
        apellidos: apellidos ?? this.apellidos,
        documento: documento ?? this.documento,
        celular: celular ?? this.celular,
        password: password ?? this.password,
        passwordVerify: passwordVerify ?? this.passwordVerify,
        estado: estado ?? this.estado,
        token: token ?? this.token,
        fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        actualizado: actualizado ?? this.actualizado);
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idUsuario': serializer.toJson<int>(idUsuario),
      'codigo': serializer.toJson<int?>(codigo),
      'nombres': serializer.toJson<String>(nombres),
      'apellidos': serializer.toJson<String?>(apellidos),
      'documento': serializer.toJson<String>(documento),
      'celular': serializer.toJson<String>(celular),
      'password': serializer.toJson<String>(password),
      'passwordVerify': serializer.toJson<String?>(passwordVerify),
      'estado': serializer.toJson<String>(estado),
      'token': serializer.toJson<String?>(token),
      'fechaCreacion': serializer.toJson<DateTime?>(fechaCreacion),
      'fechaIngreso': serializer.toJson<DateTime?>(fechaIngreso),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Usuario(
        idUsuario: serializer.fromJson<int>(json['idUsuario']),
        codigo: serializer.fromJson<int>(json['codigo']),
        nombres: serializer.fromJson<String>(json['nombres']),
        documento: serializer.fromJson<String>(json['documento'] ?? '0'),
        celular: serializer.fromJson<String>(json['celular'] ?? '0'),
        password: serializer.fromJson<String>(json['password']),
        estado: serializer.fromJson<String>(json['estado']),
        fechaCreacion: serializer.fromJson<DateTime>(json['fechaCreacion']),
        fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
        actualizado: serializer.fromJson<DateTime>(json['actualizado']));
  }
}
