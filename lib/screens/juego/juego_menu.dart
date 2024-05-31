import 'package:flutter/material.dart';
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';

class JuegoMenu extends StatelessWidget {
  const JuegoMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      ItemsMenu(
          icon: Icons.table_view_rounded,
          title: 'Cartones',
          screen: 'carton_multiple_list'),
      ItemsMenu(
          icon: Icons.paid,
          title: 'Cartones Vendidos',
          screen: 'carton_vendido_list'),
      ItemsMenu(
          icon: Icons.bar_chart_rounded,
          title: 'Estadisticas',
          screen: 'estadistica'),
      ItemsMenu(
          icon: Icons.post_add, title: 'Solicitudes', screen: 'solicitud'),
    ];

    return AppMenu(
      itemsMenu: itemsMenu,
    );
  }
}
