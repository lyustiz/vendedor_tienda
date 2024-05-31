import 'package:flutter/material.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/screens/help/helper_screen.dart';

class TitleBar extends StatelessWidget implements PreferredSize {
  final String title;
  final Widget? leading;
  final String? helpScreen;
  const TitleBar(
      {super.key, required this.title, this.leading, this.helpScreen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      centerTitle: true,
      title: Stack(children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ]),
      actions: [
        IconButton(
          onPressed: () => _onHelpScreen(context),
          icon: const Icon(Icons.help, color: Colors.white),
        ),
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
      leading: leading,
    );
  }

  @override
  Widget get child => throw UnimplementedError('joda');

  @override
  Size get preferredSize => const Size.fromHeight(70);

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
