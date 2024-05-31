import 'package:vendedor_tienda/utils/json_serializer.dart';

class UsuarioDTO {
  final int idUsuario;
  final int codigo;
  final String nombres;
  final String? documento;
  final String? celular;
  final String password;
  final String estado;
  final DateTime fechaCreacion;
  final DateTime fechaIngreso;
  final DateTime actualizado;

  UsuarioDTO({
    required this.idUsuario,
    required this.codigo,
    required this.nombres,
    this.documento,
    this.celular,
    required this.password,
    required this.estado,
    required this.fechaCreacion,
    required this.fechaIngreso,
    required this.actualizado,
  });

  factory UsuarioDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return UsuarioDTO(
        idUsuario: serializer.fromJson<int>(json['idUsuario']),
        codigo: serializer.fromJson<int>(json['codigo']),
        nombres: serializer.fromJson<String>(json['nombres']),
        documento: serializer.fromJson<String?>(json['documento']),
        celular: serializer.fromJson<String?>(json['celular']),
        password: serializer.fromJson<String>(json['password']),
        estado: serializer.fromJson<String>(json['estado']),
        fechaCreacion: serializer.fromJson<DateTime>(json['fechaCreacion']),
        fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
        actualizado: serializer.fromJson<DateTime>(json['actualizado']));
  }
}
