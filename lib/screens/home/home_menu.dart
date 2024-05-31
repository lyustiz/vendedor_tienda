import 'package:flutter/material.dart';
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      // ItemsMenu(icon: Icons.warning, title: 'Datos de Prueba', screen: 'test'),
      ItemsMenu(icon: Icons.account_circle, title: 'Cuenta', screen: 'cuenta'),
      ItemsMenu(icon: Icons.people, title: 'Clientes', screen: 'cliente'),
    ];

    return AppMenu(
      itemsMenu: itemsMenu,
      isHome: true,
    );
  }
}
