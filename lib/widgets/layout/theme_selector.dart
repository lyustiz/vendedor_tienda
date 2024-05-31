import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/entities/theme.dart';
import 'package:vendedor_tienda/blocs/preferences/preferences_bloc.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is PreferenceLoaded) {
          return IconButton(
            color: Colors.white,
            icon: Icon(state.theme == Theme.ligth
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: () {
              /*BlocProvider.of<PreferencesBloc>(context).add(UpdateTheme(
                  (state.theme == Theme.ligth) ? Theme.dark : Theme.ligth));*/
            },
          );
        } else {
          return const Icon(Icons.light_mode_sharp);
        }
      },
    );
  }
}
