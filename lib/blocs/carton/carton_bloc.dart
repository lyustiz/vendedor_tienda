import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/providers/result.dart';
import 'package:vendedor_tienda/repository/carton_repository.dart';

part 'carton_event.dart';
part 'carton_state.dart';

class CartonBloc extends Bloc<CartonEvent, CartonState> {
  CartonRepository rep = CartonRepository();

  CartonBloc() : super(CartonInitial()) {
    on<GetCarton>((event, emit) => _onGetCarton(event, emit));
    on<GetAllCarton>((event, emit) => _onGetAllCarton(event, emit));
    on<GetCartonesVendidos>(
        (event, emit) => _onGetCartonesVendidos(event, emit));
    on<UpdateCarton>((event, emit) => _onUpdateCarton(event, emit));
    on<UpateAllPromocionCarton>(
        (event, emit) => _onUpateAllPromocionCarton(event, emit));
    on<UpateCartonesMultiple>(
        (event, emit) => _onUpateCartonesMultiples(event, emit));
    on<InsertCarton>((event, emit) => _onInsertCarton(event, emit));
    on<DeleteCarton>((event, emit) => _onDeleteCarton(event, emit));
    on<SearchCarton>((event, emit) => _onSearchCarton(event, emit));
  }

  void _onGetCarton(event, emit) async {
    emit(CartonLoading());
    /*final Carton carton = await rep.selectCarton(event.carton);
    emit(CartonLoaded(carton));*/
  }

  void _onGetAllCarton(event, emit) async {
    emit(CartonLoading());
    final Respuesta<List<Carton>> resp =
        await rep.allCartones(event.idProgramacionJuego, event.estado);
    if (resp.ok) {
      emit(CartonesLoaded(resp.info!));
    } else {
      emit(CartonError(error: resp.message));
      emit(CartonesLoaded(const []));
    }
  }

  void _onGetCartonesVendidos(event, emit) async {
    emit(CartonLoading());
    final List<Carton> cartones =
        await rep.cartonesVendidos(event.idProgramacionJuego);
    emit(CartonesLoaded(cartones));
  }

  void _onUpdateCarton(event, emit) async {
    emit(CartonLoading());
    /* await rep.upateCarton(event.carton);
    final List<CartonDTO> cartones =
        await rep.allCartones(event.carton.idProgramacionJuego, event.estado);
    emit(CartonesLoaded(cartones));*/
  }

  void _onUpateCartonesMultiples(event, emit) async {
    emit(CartonLoading());
    /*await rep.upateCartonesMultiples(event.idCliente, event.idCartones);
    final List<CartonDTO> cartones =
        await rep.allCartones(event.idProgramacionJuego, '');
    emit(CartonesLoaded(cartones));*/
  }

  void _onUpateAllPromocionCarton(event, emit) async {
    emit(CartonLoading());
    /*await rep.upateAllPromocionCarton(
        event.idPromocion, event.idCliente, event.idCartones);
    final List<CartonDTO> cartones =
        await rep.allCartones(event.idProgramacionJuego, '');
    emit(CartonesLoaded(cartones));*/
  }

  void _onInsertCarton(event, emit) async {
    emit(CartonLoading());
    /*await rep.insertCarton(event.carton);
    final List<CartonDTO> cartones =
        await rep.allCartones(event.carton.idProgramacionJuego, event.estado);
    emit(CartonesLoaded(cartones));*/
  }

  void _onDeleteCarton(event, emit) async {
    emit(CartonLoading());
    /*await rep.deleteCarton(event.carton);
    final List<CartonDTO> cartones =
        await rep.allCartones(event.carton.idProgramacionJuego, event.estado);
    emit(CartonesLoaded(cartones));*/
  }

  void _onSearchCarton(event, emit) async {
    emit(CartonLoading());
    /*final List<CartonDTO> cartones =
        []; /*await rep.searchCarton(
        event.search, event.idProgramacionJuego, event.estado);*/
    emit(CartonesLoaded(cartones));*/
  }
}
