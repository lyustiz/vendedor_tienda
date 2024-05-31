import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/carton/carton_bloc.dart';
import 'package:vendedor_tienda/blocs/filter/filter_bloc.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/models/filtro.dart';

class CartonInputSearch extends StatefulWidget {
  final Juego juego;
  const CartonInputSearch({required this.juego, super.key});

  @override
  _CartonInputSearchState createState() => _CartonInputSearchState();
}

class _CartonInputSearchState extends State<CartonInputSearch> {
  TextEditingController textController = TextEditingController();
  late FocusNode myFocusNode;
  late bool isShow;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    isShow = false;
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var filterStatus = context.read<FilterBloc>();
    String estado =
        filterStatus.state.filtros.contains(TipoFiltro.vendido) ? 'V' : 'A';
    return Container(
        padding: const EdgeInsets.only(left: 8, right: 4),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                child: TextField(
                    focusNode: myFocusNode,
                    controller: textController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Nro.de carton',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _clearSearch();
                          },
                          icon: const Icon(Icons.close)),
                      filled: true,
                    ),
                    onChanged: (text) {
                      BlocProvider.of<CartonBloc>(context).add(SearchCarton(
                          text, widget.juego.idProgramacionJuego, estado));
                    }),
              ),
            ),
          ],
        ));
  }

  void _clearSearch() {
    textController.clear();
    myFocusNode.unfocus();
    BlocProvider.of<CartonBloc>(context)
        .add(SearchCarton('', widget.juego.idProgramacionJuego, 'A'));
  }
}
