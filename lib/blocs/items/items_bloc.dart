import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/juego.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  ItemsBloc() : super(ItemsState.initial()) {
    on<SelectItem>((event, emit) => _onSelectItem(event, emit));
  }

  void _onSelectItem(event, emit) {
    final String tipo = event.tipoItem;
    final item = event.item;

    if (tipo == 'juego') {
      emit(state.copyWhith(juegoSelected: item));
    }

    if (tipo == 'carton') {
      emit(state.copyWhith(cartonSelected: item));
    }

    if (tipo == 'estado') {
      emit(state.copyWhith(estado: item));
    }

    if (tipo == 'vendido') {
      emit(state.copyWhith(vendido: item));
    }
  }
}
