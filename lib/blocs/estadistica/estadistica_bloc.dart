import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/estadistica.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/venta_repository.dart';

part 'estadistica_event.dart';
part 'estadistica_state.dart';

class EstadisticaBloc extends Bloc<EstadisticaEvent, EstadisticaState> {
  VentaRepository rep = VentaRepository();

  EstadisticaBloc() : super(EstadisticaInitial()) {
    on<GetEstadistica>((event, emit) => _onGetEstadistica(event, emit));
  }

  void _onGetEstadistica(event, emit) async {
    emit(EstadisticaLoading());
    final Respuesta<Estadistica> resp =
        await rep.getEstadisticaVenta(event.idProgramacionJuego);

    if (resp.ok) {
      emit(EstadisticaLoaded(resp.info!));
    } else {
      emit(EstadisticaError(resp.message));
      emit(EstadisticaLoaded(Estadistica.initial()));
    }
  }
}
