import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/providers/DTO/carton_DTO.dart';

part 'cartonselected_event.dart';
part 'cartonselected_state.dart';

class CartonselectedBloc
    extends Bloc<CartonselectedEvent, CartonselectedState> {
  CartonselectedBloc() : super(CartonselectedState.initial()) {
    on<SelectCarton>((event, emit) => _onSelectCarton(event, emit));
    on<RemoveCarton>((event, emit) => _onRemoveCarton(event, emit));
  }

  void _onSelectCarton(event, emit) {
    final CartonDTO carton = event.carton;
    List<CartonDTO> cartones = state.cartonesSelected;
    if (cartones.contains(carton)) {
      cartones.remove(carton);
    } else {
      cartones.add(carton);
    }
    emit(state.copyWhith(
        cartonesSelected: cartones,
        nroCartones: state.cartonesSelected.length));
  }

  void _onRemoveCarton(event, emit) {
    final CartonDTO carton = event.carton;
    List<CartonDTO> cartones = state.cartonesSelected;
    cartones.remove(carton);
    emit(state.copyWhith(
        cartonesSelected: cartones,
        nroCartones: state.cartonesSelected.length));
  }
}
