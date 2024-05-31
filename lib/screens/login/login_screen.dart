import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/auth/auth_bloc.dart';
import 'package:vendedor_tienda/blocs/preferences/preferences_bloc.dart';
import 'package:vendedor_tienda/models/endpoint.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/logo.dart';
import 'package:vendedor_tienda/screens/login/login_form.dart';
import '../../widgets/layout/help_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(buildWhen: (previous, current) {
      final bool logged = (current is AuthLogged);
      if (logged) navigateTo(context, 'home');
      return !logged;
    }, builder: (context, state) {
      return AppScaffold(
        color: 'purple',
        bottomNavigationBar: GestureDetector(
          onTap: () => navigateTo(context, 'condiciones'),
          child: Container(
            height: 35,
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            child: const Text(
              'Términos y condiciones de uso',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => pushScreen(context, 'configuracion'),
                        icon: const Icon(Icons.settings)),
                    const Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: HelpButton(),
                    ),
                  ],
                ),
                const Logo(
                  titulo: 'Bingo JL',
                  fontSize: 22,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    height: 18,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: BlocBuilder<PreferencesBloc, PreferencesState>(
                      builder: (context, state) {
                        EndPoint endpoint = EndPoint(0, '', '');
                        if (state is PreferenceLoaded) {
                          endpoint = endpoints
                              .firstWhere((ep) => ep.url == state.endpoint);
                        }
                        return ListTile(
                          leading: const Icon(Icons.apartment_rounded, size: 32),
                          title: Text(
                            endpoint.empresa,
                            style: const TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(endpoint.url,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12)),
                        );
                      },
                    )),
                const LoginForm(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
