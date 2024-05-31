import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/resumen_venta.dart';
import 'package:vendedor_tienda/entities/venta.dart';
import 'package:vendedor_tienda/providers/DTO/cartones_vendidos_DTO.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/carton_repository.dart';
import 'package:vendedor_tienda/repository/venta_repository.dart';

part 'venta_event.dart';
part 'venta_state.dart';

class VentaBloc extends Bloc<VentaEvent, VentaState> {
  VentaRepository rep = VentaRepository();
  CartonRepository crep = CartonRepository();

  VentaBloc() : super(VentaInitial()) {
    on<VentaInit>((event, emit) => emit(VentaInitial()));
    on<GetResumenVentas>((event, emit) => _onGetResumenVentas(event, emit));
    on<CancelarVenta>((event, emit) => _onCancelarVenta(event, emit));
    on<ReenviarCartonesVenta>(
        (event, emit) => _onReenviarCartones(event, emit));
    on<ReenviarWhatsappVenta>(
        (event, emit) => _onReenviarWhatsapp(event, emit));
    on<ActualizarCorreoVenta>(
        (event, emit) => _onActualizarCorreoVenta(event, emit));
    on<ActualizarTelefonoVenta>(
        (event, emit) => _onActualizarTelefonoVenta(event, emit));
  }

  void _onGetResumenVentas(event, emit) async {
    emit(VentaLoading());

    Respuesta<ResumenVenta> resp =
        await rep.getResumenVenta(event.idProgramacionJuego);

    if (resp.ok) {
      emit(ResumenVentasLoaded(resumenVenta: resp.info!));
    } else {
      emit(VentaError(error: resp.message));
      emit(ResumenVentasLoaded(resumenVenta: ResumenVenta.initial()));
    }
  }

  void _onCancelarVenta(CancelarVenta event, emit) async {
    emit(CancelarVentaLoading());

    CartonesVendidosDTO respuesta = await crep.cancelarVentaCartones(
        event.venta.idVenta, event.observaciones);

    if (respuesta.esVendido) {
      emit(CancelarVentaError(error: respuesta.mensaje));
    } else {
      emit(CancelarVentaExito(mensaje: respuesta.mensaje));
    }
  }

  void _onReenviarCartones(event, emit) async {
    emit(ReenvioVentaLoading());

    Respuesta respuesta =
        await crep.reenviarCartonesCorreo(event.idVenta, event.observaciones);

    if (respuesta.ok) {
      emit(ReenvioVentaExito(mensaje: respuesta.message));
    } else {
      emit(ReenvioVentaError(error: respuesta.message));
    }
  }

  void _onReenviarWhatsapp(event, emit) async {
    emit(ReenvioVentaLoading());

    Respuesta respuesta = await crep.enviarCartonesWhatsapp(event.idVenta);

    if (respuesta.ok) {
      emit(ReenvioVentaExito(mensaje: respuesta.message));
    } else {
      emit(ReenvioVentaError(error: respuesta.message));
    }
  }

  void _onActualizarCorreoVenta(event, emit) async {
    emit(ActualizarDatosLoading());

    Respuesta respuesta = await crep.actualizarCorreoVenta(
        event.idProgramacionJuego, event.idVenta, event.correoCliente);

    if (respuesta.ok) {
      emit(ActualizarDatosExito(mensaje: respuesta.message));
    } else {
      emit(ActualizarDatosError(error: respuesta.message));
    }
  }

  void _onActualizarTelefonoVenta(event, emit) async {
    emit(ActualizarDatosLoading());

    Respuesta respuesta = await crep.actualizarTelefonoVenta(
        event.idProgramacionJuego, event.idVenta, event.telefonoCliente);

    if (respuesta.ok) {
      emit(ActualizarDatosExito(mensaje: respuesta.message));
    } else {
      emit(ActualizarDatosError(error: respuesta.message));
    }
  }
}
