import 'package:flutter/material.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/help/helper_screen.dart';

class AppTitleBarSearch extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget title;
  final String? helpScreen;
  final Widget? leading;
  const AppTitleBarSearch(
      {super.key, required this.title, this.helpScreen, this.leading})
      : preferredSize = const Size.fromHeight(70.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 5),
      height: 45,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(27, 113, 186, 1),
              Color.fromRGBO(149, 26, 130, 1),
            ],
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //leading
          Container(
            child: leading ??
                const SizedBox(
                  height: 20,
                  width: 35,
                ),
          ),
          //Titulo e Icono de Ayuda
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                title,
                Positioned(
                  right: 0,
                  top: 3,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.white, width: 3),
                        color: Theme.of(context).colorScheme.secondary),
                    child: GestureDetector(
                      onTap: () => _onHelpScreen(context),
                      child: const Icon(Icons.question_mark, size: 40),
                    ),
                  ),
                )
              ],
            ),
          ),
          //Icono de Menu
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
    );
  }

  _onHelpScreen(context) {
    if (helpScreen != null) {
      pushScreen(
          context,
          HelperScreen(
            screen: helpScreen,
          ));
    }
  }
}
