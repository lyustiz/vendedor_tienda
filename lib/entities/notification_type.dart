class NotificationType {
  final List<NTypes> types;
  final bool active;
  final int count;

  NotificationType({
    required this.types,
    required this.active,
    required this.count,
  });

  factory NotificationType.initial() {
    return NotificationType(types: [], active: false, count: 0);
  }
}

enum NTypes { general, clientes, cartones, modulos, promociones }

extension ParseToString on NTypes {
  String toShortString() {
    return toString().split('.').last;
  }
}
