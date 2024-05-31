part of 'promocion_bloc.dart';

abstract class PromocionState extends Equatable {
  const PromocionState();

  @override
  List<Object> get props => [];
}

class PromocionInitial extends PromocionState {
  @override
  String toString() => 'PromocionInitial { Promociones: [] }';
}

class PromocionLoading extends PromocionState {
  @override
  String toString() => 'PromocionLoading { Promociones: [] }';
}

class PromocionLoaded extends PromocionState {
  final Promocion promocion;

  PromocionLoaded(promocion) : this.promocion = promocion;

  @override
  List<Object> get props => [promocion];

  @override
  String toString() => 'PromocionLoaded { Promociones: $Promocion }';
}

class PromocionesLoaded extends PromocionState {
  final List<Promocion> promociones;

  PromocionesLoaded(List<Promocion> promociones)
      : this.promociones = promociones;

  @override
  List<Object> get props => [promociones];

  @override
  String toString() => 'PromocionesLoaded { Promociones: $promociones }';
}

class PromocionesVenta extends PromocionState {
  final List<Promocion> promociones;

  PromocionesVenta(List<Promocion> promociones)
      : this.promociones = promociones;

  @override
  List<Object> get props => [promociones];

  @override
  String toString() => 'PromocionesVenta { Promociones: $promociones }';
}

class PromocionExito extends PromocionState {
  final String mensaje;
  const PromocionExito({required this.mensaje});

  @override
  List<Object> get props => [mensaje];

  @override
  String toString() {
    return 'PromocionError $mensaje';
  }
}

class PromocionError extends PromocionState {
  final String error;
  const PromocionError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() {
    return 'PromocionError $error';
  }
}
