import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/solicitud.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/solicitud_repository.dart';

part 'solicitud_event.dart';
part 'solicitud_state.dart';

class SolicitudBloc extends Bloc<SolicitudEvent, SolicitudState> {
  SolicitudRepository rep = SolicitudRepository();

  SolicitudBloc() : super(SolicitudInitial()) {
    on<GetAllSolicitud>((event, emit) => _onGetAllSolicitud(event, emit));
    on<UpdateSolicitud>((event, emit) => _onUpdateSolicitud(event, emit));
    on<InsertSolicitud>((event, emit) => _onInsertSolicitud(event, emit));
  }

  void _onGetAllSolicitud(event, emit) async {
    emit(SolicitudLoading());
    final Respuesta<List<Solicitud>> resp =
        await rep.allSolicitudes(event.idProgramacionJuego);

    if (resp.ok) {
      emit(SolicitudesLoaded(resp.info!));
    } else {
      emit(SolicitudError('Error al crear el Cobro'));
    }
  }

  void _onUpdateSolicitud(event, emit) async {
    emit(SolicitudLoading());
    /*await rep.upateSolicitud(event.solicitud);
    final Solicitud solicitud =
        await rep.selectSolicitud(event.solicitud.IdSolicitud);
    emit(SolicitudLoaded(solicitud));*/
  }

  void _onInsertSolicitud(event, emit) async {
    emit(SolicitudLoading());

    Respuesta resp = await rep.insertSolicitud(event.solicitud);

    if (resp.ok) {
      emit(SolicitudExito());
    } else {
      emit(SolicitudError('Error al crear la Solicitud'));
    }
  }

  dispose() {
    SolicitudBloc().close();
  }
}
