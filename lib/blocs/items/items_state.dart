part of 'items_bloc.dart';

class ItemsState extends Equatable {
  final Juego juegoSelected;
  final Carton cartonSelected;
  final String estado;
  final String vendido;
  const ItemsState({
    required this.juegoSelected,
    required this.cartonSelected,
    required this.estado,
    required this.vendido,
  });

  factory ItemsState.initial() {
    return ItemsState(
        juegoSelected: Juego.initial(),
        cartonSelected: Carton.initial(),
        estado: 'C',
        vendido: 'N');
  }

  @override
  List<Object> get props => [juegoSelected, cartonSelected, vendido, estado];

  ItemsState copyWhith(
      {Juego? juegoSelected,
      Carton? cartonSelected,
      String? estado,
      String? vendido}) {
    return ItemsState(
        juegoSelected: juegoSelected ?? this.juegoSelected,
        cartonSelected: cartonSelected ?? this.cartonSelected,
        estado: estado ?? this.estado,
        vendido: vendido ?? this.vendido);
  }
}
