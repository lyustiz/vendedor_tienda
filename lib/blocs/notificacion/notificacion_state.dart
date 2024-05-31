part of 'notificacion_bloc.dart';

class NotificacionState extends Equatable {
  final NotificationType type;
  const NotificacionState({required this.type});

  @override
  List<Object> get props => [type];

  factory NotificacionState.initial() {
    return NotificacionState(type: NotificationType.initial());
  }

  NotificacionState add({required NTypes ntype}) {
    List<NTypes> types = this.type.types;
    int count = this.type.count;
    if (!types.contains(ntype)) {
      types.add(ntype);
      count = types.length;
    }

    var notificationType =
        NotificationType(types: types, active: true, count: count);
    return NotificacionState(type: notificationType);
  }

  NotificacionState remove({required NTypes ntype}) {
    List<NTypes> types = this.type.types;
    int count = types.length;
    List<NTypes> newTypes = [];

    if (!types.contains(ntype)) {
      newTypes = types.where((element) => element != ntype).toList();
    }
    count = newTypes.length;
    var notificationType =
        NotificationType(types: newTypes, active: count > 0, count: count);
    return NotificacionState(type: notificationType);
  }

  NotificacionState clear() {
    var notificationType = NotificationType.initial();
    return NotificacionState(type: notificationType);
  }
}
