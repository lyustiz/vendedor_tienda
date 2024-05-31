import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/providers/DTO/cartones_vendidos_DTO.dart';
import 'package:vendedor_tienda/repository/carton_repository.dart';

part 'ventacartones_event.dart';
part 'ventacartones_state.dart';

class VentaCartonesBloc extends Bloc<VentaCartonesEvent, VentaCartonesState> {
  CartonRepository rep = CartonRepository();

  VentaCartonesBloc() : super(VentaCartonesInitial()) {
    on<VentaCartonesInit>((event, emit) {
      emit(VentaCartonesInitial());
    });

    on<SetCartones>((event, emit) {
      emit(VentaCartonesRefresh());
    });

    on<VenderCartones>((event, emit) async {
      emit(VentaCartonesLoading());

      CartonesVendidosDTO cartonesBDTO = await rep.venderCartones(
        event.idProgramacionJuego,
        event.idVendedor,
        event.nombreCliente,
        event.correoCliente,
        event.telefonoCliente,
        event.idsCartones,
      );
      if (cartonesBDTO.esVendido) {
        emit(VentaCartonesExito(
            mensaje: cartonesBDTO.mensaje, idVenta: cartonesBDTO.idVenta));
      } else {
        emit(VentaCartonesError(error: cartonesBDTO.mensaje));
      }
    });
  }
}
