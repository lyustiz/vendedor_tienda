import 'package:flutter/material.dart';
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';

class ConfiguracionMenu extends StatelessWidget {
  const ConfiguracionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      ItemsMenu(icon: Icons.account_circle, title: 'Cuenta', screen: 'cuenta'),
    ];

    return AppMenu(
      itemsMenu: itemsMenu,
      isHome: true,
      isLogged: false,
    );
  }
}
