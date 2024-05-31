part of 'promocion_bloc.dart';

abstract class PromocionEvent extends Equatable {
  const PromocionEvent();

  @override
  List<Object> get props => [];
}

class GetPromocion extends PromocionEvent {
  final Promocion promocion;

  GetPromocion(this.promocion);

  @override
  List<Object> get props => [promocion];

  @override
  String toString() => 'GetPromocion';
}

class GetPromociones extends PromocionEvent {
  final List<Carton> cartones;
  final int cartonesPromocion;
  GetPromociones(this.cartones, this.cartonesPromocion);

  @override
  List<Object> get props => [cartones];

  @override
  String toString() => 'GetPromociones';
}

class SetPromociones extends PromocionEvent {
  final List<Promocion> promociones;

  SetPromociones(this.promociones);

  @override
  List<Object> get props => [promociones];

  @override
  String toString() => 'SetPromociones ';
}

class SetPromocion extends PromocionEvent {
  final Promocion promocion;

  SetPromocion(this.promocion);

  @override
  List<Object> get props => [promocion];

  @override
  String toString() => 'SetPromocion';
}

class UpdatePromocionesIndex extends PromocionEvent {
  final List<Promocion> promociones;
  final Promocion promocion;
  final int index;

  UpdatePromocionesIndex(this.promociones, this.promocion, this.index);

  @override
  List<Object> get props => [promociones, promocion, index];

  @override
  String toString() => 'UpdatePromocionesIndex ';
}

class UpdatePromocionesItem extends PromocionEvent {
  final List<Promocion> promociones;
  final Promocion promocion;

  UpdatePromocionesItem(this.promociones, this.promocion);

  @override
  List<Object> get props => [promociones, promocion];

  @override
  String toString() => 'UpdatePromocionesItem ';
}
