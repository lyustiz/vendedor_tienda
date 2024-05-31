import 'package:flutter/material.dart' hide Theme;
import 'package:vendedor_tienda/blocs/cobro/cobro_bloc.dart';
import 'package:vendedor_tienda/models/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//lenguage
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// repository
import 'package:vendedor_tienda/repository/preferences_repository.dart';
// blocs
import 'package:vendedor_tienda/blocs/preferences/preferences_bloc.dart';
import 'package:vendedor_tienda/blocs/auth/auth_bloc.dart';
import 'package:vendedor_tienda/blocs/juego/juego_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/notificacion/notificacion_bloc.dart';
//theme
import 'theme.data.dart';
//rutes
import 'package:vendedor_tienda/routes/routes.dart';

class App extends StatelessWidget {
  final PreferencesRepository preferencesRepository;
  final PreferencesBloc preferencesBloc;

  const App(
      {super.key,
      required this.preferencesRepository,
      required this.preferencesBloc});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PreferencesRepository>.value(
              value: preferencesRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PreferencesBloc>.value(value: preferencesBloc),
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(),
            ),
            BlocProvider<JuegoBloc>(
              create: (BuildContext context) => JuegoBloc(),
            ),
            BlocProvider<ItemsBloc>(
              create: (BuildContext context) => ItemsBloc(),
            ),
            BlocProvider<AuthBloc>(
              create: (BuildContext context) => AuthBloc(),
            ),
            BlocProvider<NotificacionBloc>(
              create: (BuildContext context) => NotificacionBloc(),
            ),
            BlocProvider<CobroBloc>(
              create: (BuildContext context) => CobroBloc(),
            ),
          ],
          child: BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: (context, themeState) {
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, authState) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: themesData[Theme.dark],
                    title: 'Vendedor',
                    initialRoute: 'login',
                    routes: appRoutes,
                    onUnknownRoute: (settings) {
                      return MaterialPageRoute<void>(
                        settings: settings,
                        builder: appRoutes['home']!,
                      );
                    },
                    onGenerateRoute: (settings) =>
                        _getRoute(settings, authState),
                    supportedLocales: const [
                      Locale('es'),
                      Locale('en'),
                    ],
                    navigatorObservers: const [],
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      FormBuilderLocalizations.delegate,
                    ],
                  );
                },
              );
            },
          ),
        ));
  }

  Route<dynamic> _getRoute(RouteSettings settings, AuthState authState) {
    if (authState is! AuthLogged) {
      if (settings.name != 'login') {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: appRoutes['login']!,
        );
      }
    }

    if (appRoutes[settings.name] == null) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: appRoutes['home']!,
      );
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: appRoutes['home']!,
    );
  }
}
