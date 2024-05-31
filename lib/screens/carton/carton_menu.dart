import 'package:flutter/material.dart';
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';

class CartonMenu extends StatelessWidget {
  const CartonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      ItemsMenu(
          icon: Icons.paid,
          title: 'Resumen Ventas',
          screen: 'ventas_list',
          color: Colors.green),
    ];
    return AppMenu(
      itemsMenu: itemsMenu,
    );
  }
}
