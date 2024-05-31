import 'package:flutter/material.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/help/helper_global.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.white,
      icon: const Icon(Icons.help),
      onPressed: () => pushScreen(context, const HelperGlobal()),
    );
  }
}
