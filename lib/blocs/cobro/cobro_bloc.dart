import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/cobro.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/cobro_repository.dart';

part 'cobro_event.dart';
part 'cobro_state.dart';

class CobroBloc extends Bloc<CobroEvent, CobroState> {
  CobroRepository rep = CobroRepository();

  CobroBloc() : super(CobroInitial()) {
    on<GetCobro>((event, emit) => _onGetCobro(event, emit));
    on<InsertCobro>((event, emit) => _onInsertCobro(event, emit));
    on<ResetCobro>((event, emit) => _onResetCobro(event, emit));
  }

  void _onGetCobro(event, emit) async {
    emit(CobroLoading());
    final Respuesta<Cobro> resp = await rep.selectCobroJuego(event.idJuego);

    if (resp.ok) {
      emit(CobroLoaded(resp.info!));
    } else {
      emit(CobroError(resp.message));
    }
  }

  void _onInsertCobro(event, emit) async {
    emit(CobroLoading());
    Respuesta<Cobro> resp = await rep.insertCobro(event.idProgramacionJuego);

    if (resp.ok) {
      emit(CobroExito());
    } else {
      emit(CobroError('Error al crear el Cobro'));
    }
  }

  void _onResetCobro(event, emit) async {
    emit(CobroInitial());
  }

  dispose() {
    CobroBloc().close();
  }
}
