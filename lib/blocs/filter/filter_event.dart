part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class AddFiltro extends FilterEvent {
  final TipoFiltro filtro;
  const AddFiltro({required this.filtro});
  @override
  List<Object> get props => [filtro];
}

class RemoveFiltro extends FilterEvent {
  final TipoFiltro filtro;
  const RemoveFiltro({required this.filtro});
  @override
  List<Object> get props => [filtro];
}

class ClearFiltros extends FilterEvent {
  const ClearFiltros();
  @override
  List<Object> get props => [];
}
