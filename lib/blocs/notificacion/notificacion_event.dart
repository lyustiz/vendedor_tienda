part of 'notificacion_bloc.dart';

abstract class NotificacionEvent extends Equatable {
  const NotificacionEvent();

  @override
  List<Object> get props => [];
}

class SetNotification extends NotificacionEvent {
  final NTypes ntype;
  const SetNotification({required this.ntype});
  @override
  List<Object> get props => [ntype];
}

class RemoveNotification extends NotificacionEvent {
  final NTypes ntype;
  const RemoveNotification({required this.ntype});
  @override
  List<Object> get props => [ntype];
}

class ClearNotification extends NotificacionEvent {
  final bool all;
  const ClearNotification(this.all);
  @override
  List<Object> get props => [all];
}
