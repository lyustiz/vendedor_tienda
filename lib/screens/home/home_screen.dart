import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/auth/auth_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/notificacion/notificacion_bloc.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar.dart';
import './home_menu.dart';
import './witgets/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, stateAuth) {
        return BlocBuilder<ItemsBloc, ItemsState>(
          builder: (context, state) {
            ItemsBloc itemsBloc = context.read<ItemsBloc>();
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: AppScaffold(
                titleBar: AppTitleBar(
                  title: (stateAuth is AuthLogged)
                      ? stateAuth.usuario.nombres
                      : 'Vendedor',
                  helpScreen: 'inicio',
                  nroNotifications:
                      context.read<NotificacionBloc>().state.type.count,
                ),
                drawer: const HomeMenu(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'Seleccione Opcion:',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      HomeButton(
                        icon: Icons.attach_money,
                        title: 'Venta',
                        color: Theme.of(context).colorScheme.primary,
                        onTap: () {
                          itemsBloc
                              .add(const SelectItem(tipoItem: 'estado', item: 'A'));
                          pushScreen(context, 'juego_list');
                        },
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '',
                              style: TextStyle(
                                  color: Colors.primaries.first, fontSize: 26),
                            ),
                          ],
                        ),
                      ),
                      HomeButton(
                        icon: Icons.search,
                        title: 'Consulta',
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        onTap: () {
                          itemsBloc
                              .add(const SelectItem(tipoItem: 'estado', item: 'C'));
                          pushScreen(context, 'juego_list');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
