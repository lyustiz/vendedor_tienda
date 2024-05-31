import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/providers/DTO/cartones_bloqueados_DTO.dart';
import 'package:vendedor_tienda/repository/carton_repository.dart';

part 'bloqueocartones_event.dart';
part 'bloqueocartones_state.dart';

class BloqueoCartonesBloc
    extends Bloc<BloqueoCartonesEvent, BloqueoCartonesState> {
  CartonRepository rep = CartonRepository();

  BloqueoCartonesBloc() : super(BloqueoCartonesInitial()) {
    on<BloqueoCartonesInit>((event, emit) {
      emit(BloqueoCartonesInitial());
    });

    on<BloquearCartones>((event, emit) async {
      emit(BloqueoCartonesLoading());

      CartonesBloqueadosDTO cartonesBDTO = await rep.bloqueaCartones(
          event.idProgramacionJuego, event.idVendedor, event.cartones);
      if (cartonesBDTO.esBloqueado) {
        emit(BloqueoCartonesExito(
            mensaje: cartonesBDTO.mensaje, cartonesBloqueados: event.cartones));
      } else {
        emit(BloqueoCartonesError(error: cartonesBDTO.mensaje));
      }
    });
  }
}
