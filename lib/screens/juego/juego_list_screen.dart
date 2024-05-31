import 'package:flutter/material.dart';
import 'package:vendedor_tienda/blocs/notificacion/notificacion_bloc.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/juego/juego_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/utils/format/format_data.dart' as Fd;
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';

class JuegoListScreen extends StatelessWidget {
  const JuegoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final juegoEstado = context.read<ItemsBloc>().state.estado;
    context.read<JuegoBloc>().add(GetAllJuego(juegoEstado));

    return BlocBuilder<JuegoBloc, JuegoState>(
      builder: (context, state) {
        return AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: (juegoEstado == 'C')
                ? 'Juegos Terminados'
                : 'Venta de Cartones',
            leading: IconButton(
                onPressed: () => navigateTo(context, 'home'),
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                )),
            helpScreen: 'juegos',
            nroNotifications: context.read<NotificacionBloc>().state.type.count,
          ),
          drawer: const AppMenu(itemsMenu: []),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () =>
                context.read<JuegoBloc>().add(GetAllJuego(juegoEstado)),
            child: const Icon(Icons.refresh),
          ),
          child: (state is JuegosLoaded)
              ? Scrollbar(
                  interactive: true,
                  thumbVisibility: true,
                  radius: const Radius.circular(30),
                  thickness: 10,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 4),
                      itemCount: state.juegos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemsJuegos(context, context.read<ItemsBloc>(),
                            state.juegos[index]);
                      }),
                )
              : const LinearProgressIndicator(),
        );
      },
    );
  }

  Widget itemsJuegos(context, itemsBloc, Juego juego) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer
          ],
        ),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ListTile(
              leading: const SizedBox(
                width: 50,
              ),
              title: Text(
                  'Juego ${juego.idProgramacionJuego.toString().padLeft(3, '0')}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(
                Fd.formatDateTime(juego.fechaProgramada),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              trailing: const Icon(
                Icons.manage_search,
                size: 40,
                color: Colors.white,
              ),
              onTap: () {
                itemsBloc.add(SelectItem(tipoItem: 'juego', item: juego));
                navigateTo(context, 'juego');
              }),
          Positioned(
            left: -2.5,
            top: -2.5,
            child: Container(
              width: 77,
              height: 77,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.secondaryContainer
                  ],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(30),
                    color: (juego.estado == 'C')
                        ? Colors.redAccent
                        : Colors.lightGreen),
                child: const Icon(
                  Icons.power_settings_new_sharp,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
