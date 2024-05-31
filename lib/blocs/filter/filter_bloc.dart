import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vendedor_tienda/models/filtro.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState.initial()) {
    on<AddFiltro>((event, emit) => _onAddFilter(event, emit));
    on<RemoveFiltro>((event, emit) => _onRemoveFilter(event, emit));
    on<ClearFiltros>((event, emit) => _onClearFilter(event, emit));
  }

  _onAddFilter(event, emit) async {
    emit(state.addfilter(newfiltro: event.filtro));
  }

  _onRemoveFilter(event, emit) {
    emit(state.remove(filtro: event.filtro));
  }

  _onClearFilter(event, emit) {
    emit(state.clear());
  }
}
