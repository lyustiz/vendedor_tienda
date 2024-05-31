import 'package:vendedor_tienda/utils/json_serializer.dart';

class Cliente {
  final int idCliente;
  final String codigo;
  final String nombre;
  final String celular;
  final String? documento;
  final String? barrio;
  final String correo;
  final String? password;
  final String? passwordConfirmacion;
  final String estado;
  final DateTime? actualizado;

  Cliente({
    required this.idCliente,
    required this.codigo,
    required this.nombre,
    required this.celular,
    this.documento,
    this.barrio,
    required this.correo,
    required this.password,
    this.passwordConfirmacion,
    required this.estado,
    required this.actualizado,
  });

  factory Cliente.initial() {
    return Cliente(
        idCliente: 0,
        codigo: '',
        nombre: '',
        celular: '',
        documento: '',
        barrio: '',
        correo: '',
        password: '',
        passwordConfirmacion: '',
        estado: '',
        actualizado: null);
  }

  Cliente copyWith(
      {int? idCliente,
      String? codigo,
      String? nombre,
      String? celular,
      String? documento,
      String? barrio,
      String? correo,
      String? password,
      String? passwordConfirmacion,
      String? estado,
      DateTime? actualizado}) {
    return Cliente(
        idCliente: idCliente ?? this.idCliente,
        codigo: codigo ?? this.codigo,
        nombre: nombre ?? this.nombre,
        celular: celular ?? this.celular,
        documento: documento ?? this.documento,
        barrio: barrio ?? this.barrio,
        correo: correo ?? this.correo,
        password: password ?? this.password,
        passwordConfirmacion: passwordConfirmacion ?? this.passwordConfirmacion,
        estado: estado ?? this.estado,
        actualizado: actualizado ?? this.actualizado);
  }

  factory Cliente.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return Cliente(
      idCliente: serializer.fromJson<int>(json['idCliente']),
      codigo: serializer.fromJson<String>(json['codigo']),
      nombre: serializer.fromJson<String>(json['nombre']),
      celular: serializer.fromJson<String>(json['celular']),
      documento: serializer.fromJson<String>(json['documento']),
      barrio: serializer.fromJson<String>(json['barrio']),
      correo: serializer.fromJson<String>(json['correo']),
      password: serializer.fromJson<String?>(json['password']),
      passwordConfirmacion:
          serializer.fromJson<String?>(json['passwordConfirmacion']),
      estado: serializer.fromJson<String>(json['estado']),
      actualizado: serializer.fromJson<DateTime?>(json['actualizado']),
    );
  }

  static List<Cliente> fromListJson(List<dynamic> juegosJson, String estado) {
    List<Cliente> clientes = [];

    for (var juegoJson in juegosJson) {
      Cliente cliente = Cliente.fromJson(juegoJson);
      if (cliente.estado == estado || estado == '') {
        clientes.add(cliente);
      }
    }
    return clientes;
  }

  Map<String, dynamic> toJson() {
    var serializer = const JsonSerializer();
    return <String, dynamic>{
      'idCliente': serializer.toJson<int>(idCliente),
      'codigo': serializer.toJson<String>(codigo),
      'nombre': serializer.toJson<String>(nombre),
      'celular': serializer.toJson<String>(celular),
      'documento': serializer.toJson<String?>(documento),
      'barrio': serializer.toJson<String?>(barrio),
      'correo': serializer.toJson<String>(correo),
      'password': serializer.toJson<String?>(password),
      'passwordConfirmacion': serializer.toJson<String?>(passwordConfirmacion),
      'estado': serializer.toJson<String>(estado),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }
}
