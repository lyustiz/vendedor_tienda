part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final List<TipoFiltro> filtros;
  final int count;
  const FilterState({required this.filtros, this.count = 0});

  @override
  List<Object> get props => [filtros, count];

  factory FilterState.initial() {
    return FilterState(filtros: []);
  }

  FilterState addfilter({required TipoFiltro newfiltro}) {
    this.filtros.add(newfiltro);
    return FilterState(filtros: this.filtros, count: this.filtros.length);
  }

  FilterState remove({required TipoFiltro filtro}) {
    this.filtros.removeWhere((item) => item == filtro);
    return FilterState(filtros: this.filtros, count: this.filtros.length);
  }

  FilterState clear() {
    return FilterState.initial();
  }
}
