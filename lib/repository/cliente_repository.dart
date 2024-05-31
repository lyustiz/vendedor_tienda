import 'package:vendedor_tienda/entities/cliente.dart';
import 'package:vendedor_tienda/providers/api.dart';
import 'package:vendedor_tienda/providers/result.dart';

class ClienteRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  ResultApi result = ResultApi(isSucess: false);
  Respuesta respuesta = Respuesta(false, 'Error');

  Future<List<Cliente>> allClientes(
      {String estado = '', orden = 'nombre'}) async {
    var params = {'estado': estado, 'orden': orden};

    try {
      result = await api.getData('clientes', params);
    } catch (e) {
      return [];
    }

    List<Cliente> cliente = [];

    if (result.isSucess) {
      cliente = Cliente.fromListJson(result.data, estado);
    }

    return cliente;
  }

  Future<List<Cliente>> searchCliente(String search,
      {String estado = ''}) async {
    var params = {'search': search, 'estado': estado};

    try {
      result = await api.getData('clientes/search', params);
    } catch (e) {
      return [];
    }

    List<Cliente> cliente = [];

    if (result.isSucess) {
      cliente = Cliente.fromListJson(result.data, estado);
    }

    return cliente;
  }
}
