import 'package:vendedor_tienda/entities/cliente.dart';
import 'package:vendedor_tienda/utils/json_serializer.dart';

class ClienteDTO {
  final int idCliente;
  final String codigo;
  final String nombre;
  final String celular;
  final String? documento;
  final String? barrio;
  final String? correo;
  final String estado;
  final String? actualizado;

  ClienteDTO({
    required this.idCliente,
    required this.codigo,
    required this.nombre,
    required this.celular,
    this.documento,
    this.barrio,
    this.correo,
    required this.estado,
    this.actualizado,
  });

  factory ClienteDTO.fromJson(Map<String, dynamic> json) {
    var serializer = const JsonSerializer();
    return ClienteDTO(
      idCliente: serializer.fromJson<int>(json['idCliente']),
      codigo: serializer.fromJson<String>(json['codigo']),
      nombre: serializer.fromJson<String>(json['nombre']),
      celular: serializer.fromJson<String>(json['celular']),
      documento: serializer.fromJson<String?>(json['documento']),
      barrio: serializer.fromJson<String?>(json['barrio']),
      correo: serializer.fromJson<String?>(json['correo']),
      estado: serializer.fromJson<String>(json['estado']),
      actualizado: serializer.fromJson<String?>(
          json['actualizado'] ?? DateTime.now().toIso8601String()),
    );
  }

  static List<ClienteDTO> fromListJson(List<dynamic> ClientesJson) {
    List<ClienteDTO> clientesDTO = [];

    for (var cienteJson in ClientesJson) {
      ClienteDTO clienteDto = ClienteDTO.fromJson(cienteJson);
      clientesDTO.add(clienteDto);
    }

    clientesDTO.sort((a, b) => a.nombre.compareTo(b.nombre));

    return clientesDTO;
  }

  factory ClienteDTO.fromCliente(Cliente cliente, {required int idVendedor}) {
    String actualizado = cliente.actualizado != null
        ? cliente.actualizado!.toIso8601String()
        : DateTime.now().toIso8601String();
    return ClienteDTO(
      idCliente: cliente.idCliente,
      codigo: cliente.codigo,
      nombre: cliente.nombre,
      celular: cliente.celular,
      documento: cliente.documento ?? '',
      barrio: cliente.barrio ?? '',
      correo: cliente.correo,
      estado: cliente.estado,
      actualizado: actualizado,
    );
  }

  static List<ClienteDTO> fromListClientes(List<Cliente> clientes,
      {required int idVendedor}) {
    List<ClienteDTO> cartonesDTO = [];

    for (var carton in clientes) {
      cartonesDTO.add(ClienteDTO.fromCliente(carton, idVendedor: idVendedor));
    }

    return cartonesDTO;
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
      'correo': serializer.toJson<String?>(correo),
      'estado': serializer.toJson<String>(estado),
      'actualizado': serializer.toJson<String?>(actualizado),
    };
  }
}
