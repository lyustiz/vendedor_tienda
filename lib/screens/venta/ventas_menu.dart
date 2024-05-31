import 'package:flutter/material.dart';
import 'package:vendedor_tienda/widgets/menus/app_menu.dart';

class VentaMenu extends StatelessWidget {
  const VentaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemsMenu> itemsMenu = [
      // ItemsMenu(icon: Icons.qr_code, title: 'Escanear', screen: 'carton_scan'),
      ItemsMenu(
          icon: Icons.table_view_rounded,
          title: 'Vender Cartones',
          screen: 'carton_multiple_list'),
    ];
    return AppMenu(
      itemsMenu: itemsMenu,
    );
  }
}
