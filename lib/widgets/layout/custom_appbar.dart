import 'package:flutter/material.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/help/helper_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final String? helpScreen;
  final Widget? leading;

  const CustomAppBar(
      {super.key, required this.title, this.helpScreen, this.leading})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //leading
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: leading,
        ),
        //Titulo e Icono de Ayuda
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(top: 8, bottom: 6),
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 8, right: 47),
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(30)),
                      border: Border.all(color: Colors.white, width: 2),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondaryContainer,
                        ],
                      )),
                  child: Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(color: Colors.white, width: 3),
                        color: Theme.of(context).colorScheme.secondary),
                    child: GestureDetector(
                      onTap: () => _onHelpScreen(context),
                      child: const Text(
                        '?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 46,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ])),
        ),
        //Icono de Menu
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
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
