import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/help/help_bloc.dart';
import 'package:vendedor_tienda/entities/help.dart';
import 'package:vendedor_tienda/widgets/layout/app_container.dart';
import 'package:vendedor_tienda/widgets/layout/app_icon.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/widgets/layout/help_icon.dart';
import 'package:vendedor_tienda/models/iconos.dart' as ICO;

class HelperScreen extends StatelessWidget {
  final String? screen;
  const HelperScreen({super.key, this.screen});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: 'purple',
      titleBar: AppTitleBarVariant(
        color: 'white',
        title: 'Ayuda $screen',
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      child: BlocProvider(
        create: (context) => HelpBloc(),
        child: BlocBuilder<HelpBloc, HelpState>(
          builder: (context, state) {
            if (state is HelpInitial) {
              context.read<HelpBloc>().add(GetHelp(screen!));
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (state is HelpLoaded)
                    AppContainer(
                        child: Column(
                      children: [
                        ListTile(
                          leading: const HelpIcon(
                            radius: 40,
                          ),
                          title: Text('$screen'.toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 2),
                          child: Text(
                            state.help.texto,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                  offset: Offset(0.1, 0.1),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(200, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            ...state.help.items
                                .map((e) => itemContainer(context, e))
                          ],
                        )
                      ],
                    ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget itemContainer(context, HelpItem helpItem) {
    Map<String, Color> itemColor = {
      'info': Theme.of(context).colorScheme.secondary,
      'warning': Colors.amber,
      'success': Colors.green,
      'error': Colors.redAccent,
      'blue': Colors.blue,
      'grey': Colors.blueGrey
    };

    return Stack(
      children: [
        AppContainer(
          variant: 'secondary',
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          padding:
              const EdgeInsets.only(top: 8, bottom: 10, left: 50, right: 8),
          borderRadius: 15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${helpItem.titulo}:',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(helpItem.texto, textAlign: TextAlign.justify),
            ],
          ),
        ),
        Positioned(
            left: 8,
            top: 12,
            child: AppIcon(
              icon: ICO.iconData[helpItem.icono] ?? Icons.info,
              color: itemColor[helpItem.tipo] ?? Colors.blue,
            ))
      ],
    );
  }
}
