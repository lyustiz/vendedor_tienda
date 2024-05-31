import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/carton_repository.dart';

part 'enviocartones_event.dart';
part 'enviocartones_state.dart';

class EnviocartonesBloc extends Bloc<EnviocartonesEvent, EnviocartonesState> {
  CartonRepository rep = CartonRepository();

  EnviocartonesBloc() : super(EnviocartonesInitial()) {
    on<EnvioCartonesInit>((event, emit) {
      emit(EnviocartonesInitial());
    });

    on<EnvioCartonesCorreo>((event, emit) async {
      emit(EnviocartonesLoading());

      Respuesta respuesta = await rep.enviarCartonesCorreo(event.idVenta);

      if (respuesta.ok) {
        emit(EnviocartonesExito(mensaje: respuesta.message));
      } else {
        emit(EnviocartonesError(error: respuesta.message));
      }
    });

    on<EnvioCartonesWhatsapp>((event, emit) async {
      emit(EnviocartonesLoading());

      Respuesta respuesta = await rep.enviarCartonesWhatsapp(event.idVenta);
      if (respuesta.ok) {
        emit(EnviocartonesExito(mensaje: respuesta.message));
      } else {
        emit(EnviocartonesError(error: respuesta.message));
      }
    });
  }
}
