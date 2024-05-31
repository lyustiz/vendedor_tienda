import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/models/promocion.dart';

import 'package:vendedor_tienda/repository/promocion_repository.dart';

part 'promocion_event.dart';
part 'promocion_state.dart';

class PromocionBloc extends Bloc<PromocionEvent, PromocionState> {
  PromocionRepository rep = PromocionRepository();

  PromocionBloc() : super(PromocionInitial()) {
    on<GetPromociones>((event, emit) => _onGetPromociones(event, emit));
    on<SetPromociones>((event, emit) => _onSetPromociones(event, emit));
    on<UpdatePromocionesIndex>(
        (event, emit) => _onUpdatePromocionesIndex(event, emit));
    on<UpdatePromocionesItem>(
        (event, emit) => _onUpdatePromocionesItem(event, emit));
  }

  void _onGetPromociones(event, emit) {
    final List<Carton> cartones = event.cartones;
    final List<Promocion> promociones = rep.listCartonesToPromocion(cartones);
    emit(PromocionesLoaded(promociones));
  }

  void _onSetPromociones(event, emit) async {
    final List<Promocion> promociones = event.promociones;
    emit(PromocionesLoaded(promociones));
  }

  void _onUpdatePromocionesIndex(event, emit) {
    emit(PromocionLoading());
    final List<Promocion> promociones = event.promociones;
    final Promocion promocion = event.promocion;
    final int index = event.index;
    final List<Promocion> updPromociones =
        rep.updatePromocionesIndex(promociones, promocion, index);
    emit(PromocionesLoaded(updPromociones));
  }

  void _onUpdatePromocionesItem(event, emit) {
    emit(PromocionLoading());
    final List<Promocion> promociones = event.promociones;
    final Promocion promocion = event.promocion;
    final List<Promocion> updPromociones =
        rep.updatePromocionesItem(promociones, promocion);
    emit(PromocionesLoaded(updPromociones));
  }
}
