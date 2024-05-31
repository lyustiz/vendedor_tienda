import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendedor_tienda/models/notification_type.dart';

part 'notificacion_event.dart';
part 'notificacion_state.dart';

class NotificacionBloc extends Bloc<NotificacionEvent, NotificacionState> {
  NotificacionBloc() : super(NotificacionState.initial()) {
    on<SetNotification>((event, emit) => _onSetNotification(event, emit));
    on<RemoveNotification>((event, emit) => _onRemoveNotification(event, emit));
    on<ClearNotification>((event, emit) => _onClearNotification(event, emit));
  }

  _onSetNotification(event, emit) async {
    emit(state.add(ntype: event.ntype));
  }

  _onRemoveNotification(event, emit) {
    emit(state.remove(ntype: event.ntype));
  }

  _onClearNotification(event, emit) {
    emit(state.clear());
  }
}
