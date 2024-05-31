import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/providers/DTO/juego_premios_DTO.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/juego_repository.dart';

import 'package:equatable/equatable.dart';

part 'juego_event.dart';
part 'juego_state.dart';

class JuegoBloc extends Bloc<JuegoEvent, JuegoState> {
  JuegoRepository rep = JuegoRepository();

  JuegoBloc() : super(JuegoInitial()) {
    on<GetJuego>((event, emit) => _onGetJuego(event, emit));
    on<GetAllJuego>((event, emit) => _onGetAllJuego(event, emit));
    on<SelectJuego>((event, emit) => _onSelectJuego(event, emit));
  }

  void _onGetJuego(event, emit) async {
    emit(JuegoLoading());
    final Juego juego = await rep.selectJuego(event.juego);
    emit(JuegoLoaded(juego));
  }

  void _onGetAllJuego(event, emit) async {
    emit(JuegoLoading());
    final Respuesta<List<Juego>> resp = await rep.allJuegos(event.estado);

    if (resp.ok) {
      emit(JuegosLoaded(resp.info!));
    } else {
      emit(const JuegoError('Error al crear el Cobro'));
    }
  }

  void _onSelectJuego(event, emit) async {
    emit(JuegoSelected(event.juego));
  }
}
