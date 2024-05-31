import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/providers/DTO/cartones_bloqueados_DTO.dart';
import 'package:vendedor_tienda/providers/DTO/cartones_vendidos_DTO.dart';
import 'package:vendedor_tienda/providers/api.dart';
import 'package:vendedor_tienda/providers/result.dart';

class CartonRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  ResultApi result = ResultApi(isSucess: false);
  Respuesta respuesta = Respuesta(false, 'Error');

  Future<Respuesta<List<Carton>>> allCartones(
      int idProgramacionJuego, String estado) async {
    var params = {'IdProgramacionJuego': '$idProgramacionJuego'};

    var resp = Respuesta<List<Carton>>(false, 'Error');
    try {
      result = await api.getData('cartonestienda', params);
    } catch (e) {
      return resp.copyWith(message: 'Error al obtener Cartones');
    }

    if (result.isSucess) {
      return resp.copyWith(
          ok: true, info: Carton.fromListJson(result.data, estado));
    } else {
      return resp.copyWith(
          ok: false, message: result.data['mensaje'] ?? result.data['message']);
    }
  }

  Future<List<Carton>> cartonesVendidos(int idProgramacionJuego) async {
    var params = {'IdProgramacionJuego': '$idProgramacionJuego'};

    try {
      result = await api.getData('cartonestienda/vendidos', params);
    } catch (e) {
      return [];
    }

    List<Carton> cartonesDTO = [];

    if (result.isSucess) {
      cartonesDTO = Carton.fromListJson(result.data, 'V');
    }

    return cartonesDTO;
  }

  Future<CartonesBloqueadosDTO> bloqueaCartones(
      int idProgramacionJuego, int idVendedor, List<Carton> cartones) async {
    var params = {
      "idProgramacionJuego": idProgramacionJuego,
      "idVendedor": idVendedor,
      "idsCartones": cartones.map((c) => c.idCarton).toList()
    };

    var cartonesBloqueadosDTO = CartonesBloqueadosDTO(
        esBloqueado: false,
        idCartonesValidos: [],
        mensaje: 'Error al Bloquear cartones',
        cartones: []);

    try {
      result = await api.putData('bloqueaventacartones', params);
    } catch (e) {
      return cartonesBloqueadosDTO;
    }

    if (result.isSucess) {
      var cartonesBloqueadosJson = result.data;
      cartonesBloqueadosDTO =
          CartonesBloqueadosDTO.fromJson(cartonesBloqueadosJson, cartones);
    } else {
      cartonesBloqueadosDTO = CartonesBloqueadosDTO(
          esBloqueado: false,
          idCartonesValidos: [],
          mensaje: result.data['message'],
          cartones: []);
    }

    return cartonesBloqueadosDTO;
  }

  Future<CartonesVendidosDTO> venderCartones(
      int idProgramacionJuego,
      int idVendedor,
      String nombreCliente,
      String correoCliente,
      String telefonoCliente,
      List<int> idsCartones) async {
    var params = {
      "idProgramacionJuego": idProgramacionJuego,
      "idVendedor": idVendedor,
      "nombreCliente": nombreCliente,
      "correoCliente": correoCliente,
      "telefonoCliente": telefonoCliente,
      "idsCartones": idsCartones
    };

    var cartonVendidoDTO = CartonesVendidosDTO(
        esVendido: false,
        cartonesVendidos: [],
        mensaje: 'Error al vender cartones',
        idVenta: 0);

    try {
      result = await api.putData('ventacartonestienda', params);
    } catch (e) {
      return cartonVendidoDTO;
    }

    if (result.isSucess) {
      var cartonesVendidosJson = result.data['informacion'];
      cartonVendidoDTO = CartonesVendidosDTO.fromJson(
          cartonesVendidosJson, result.data['mensaje']);
    } else {
      cartonVendidoDTO = CartonesVendidosDTO(
          esVendido: false,
          cartonesVendidos: [],
          mensaje: result.data['message'],
          idVenta: 0);
    }

    return cartonVendidoDTO;
  }

  Future<Respuesta> actualizarCorreoVenta(
      int idProgramacionJuego, int idventa, String correoCliente) async {
    var params = {
      "idProgramacionJuego": idProgramacionJuego,
      "idventa": idventa,
      "correoCliente": correoCliente,
    };

    var respuesta = Respuesta(false, 'Error al actualizar Correo');

    try {
      result = await api.postData('ventacartonestienda/modificarcorreo',
          params: params);
    } catch (e) {
      return respuesta;
    }

    if (result.isSucess) {
      respuesta = Respuesta(true, result.data['mensaje']);
    } else {
      respuesta = Respuesta(false, result.data['mensaje']);
    }

    return respuesta;
  }

  Future<Respuesta> actualizarTelefonoVenta(
      int idProgramacionJuego, int idventa, String telefonoCliente) async {
    var params = {
      "idProgramacionJuego": idProgramacionJuego,
      "idventa": idventa,
      "telefonoCliente": telefonoCliente,
    };

    var respuesta = Respuesta(false, 'Error al actualizar Correo');

    try {
      result = await api.postData('ventacartonestienda/modificartelefono',
          params: params);
    } catch (e) {
      return respuesta;
    }

    if (result.isSucess) {
      respuesta = Respuesta(true, result.data['mensaje']);
    } else {
      respuesta = Respuesta(false, result.data['mensaje']);
    }

    return respuesta;
  }

  Future<CartonesVendidosDTO> cancelarVentaCartones(
      int idventa, String observaciones) async {
    var params = {"idventa": idventa, "observaciones": observaciones};

    var cartonVendidoDTO = CartonesVendidosDTO(
        esVendido: false,
        cartonesVendidos: [],
        mensaje: 'Error al cancelar venta',
        idVenta: idventa);

    try {
      result =
          await api.postData('ventacartonestienda/cancelar', params: params);
    } catch (e) {
      return cartonVendidoDTO;
    }

    if (result.isSucess) {
      cartonVendidoDTO = cartonVendidoDTO.copyWith(
          esVendido: false, mensaje: result.data['mensaje']);
    } else {
      cartonVendidoDTO = CartonesVendidosDTO(
          esVendido: true,
          cartonesVendidos: [],
          mensaje: result.data['message'],
          idVenta: 0);
    }

    return cartonVendidoDTO;
  }

  Future<Respuesta> enviarCartonesCorreo(int idventa) async {
    var params = {
      "idProgramacionJuego": 0,
      "idVendedor": 0,
      "idVenta": idventa,
      "nombreCliente": "dummy",
      "correoCliente": "dummy@gmail.com",
      "idsCartones": [0]
    };

    try {
      result =
          await api.postData('enviocartonestienda/enviocorreo', params: params);
    } catch (e) {
      return Respuesta(false, e.toString());
    }

    if (result.isSucess) {
      return Respuesta(true, result.data['message'],
          info: result.data['message']);
    } else {
      return Respuesta(false, result.data['message'],
          info: result.data['body']['detalle']);
    }
  }

  Future<Respuesta> reenviarCartonesCorreo(
      int idventa, String observaciones) async {
    var params = {"idVenta": idventa, "observaciones": observaciones};
    try {
      result = await api.postData('enviocartonestienda/reenviocorreo',
          params: params);
    } catch (e) {
      return Respuesta(false, e.toString());
    }

    if (result.isSucess) {
      return Respuesta(true, result.data['message'],
          info: result.data['message']);
    } else {
      return Respuesta(false, result.data['message']);
    }
  }

  Future<Respuesta> enviarCartonesWhatsapp(int idventa) async {
    var params = {
      "idProgramacionJuego": 0,
      "idVendedor": 0,
      "idVenta": idventa,
      "nombreCliente": "dummy",
      "correoCliente": "dummy@gmail.com",
      "idsCartones": []
    };

    try {
      result = await api.postData('enviocartonestienda/enviowhatsapp',
          params: params);
    } catch (e) {
      return Respuesta(false, e.toString());
    }

    if (result.isSucess) {
      return Respuesta(true, result.data['mensaje'],
          info: result.data['informacion']);
    } else {
      return Respuesta(false, result.data['message'],
          info: result.data['body']['detalle']);
    }
  }
}
