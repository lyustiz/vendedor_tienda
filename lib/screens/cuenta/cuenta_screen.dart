import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/blocs/auth/auth_bloc.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/utils/format/format_data.dart' as fdt;

class CuentaScreen extends StatelessWidget {
  const CuentaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: "Cuenta",
            leading: IconButton(
                onPressed: () => navigateTo(context, 'home'),
                icon: const Icon(Icons.chevron_left)),
            helpScreen: 'Home',
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 55,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 90,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).colorScheme.secondaryContainer
                          ],
                        ),
                      ),
                      child: (authState is AuthLogged)
                          ? ListView(
                              children: [
                                ListTile(
                                    dense: true,
                                    leading: const Icon(Icons.phone_android,
                                        size: 30, color: Colors.white),
                                    title: const Text('Celular'),
                                    subtitle:
                                        Text(authState.usuario.celular)),
                                ListTile(
                                    dense: true,
                                    leading: const Icon(Icons.account_box,
                                        size: 30, color: Colors.white),
                                    title: const Text('Nombre'),
                                    subtitle:
                                        Text(authState.usuario.nombres)),
                                ListTile(
                                    dense: true,
                                    leading: const Icon(Icons.account_box,
                                        size: 30, color: Colors.white),
                                    title: const Text('Documento'),
                                    subtitle:
                                        Text(authState.usuario.documento)),
                                ListTile(
                                    dense: true,
                                    leading: const Icon(Icons.calendar_today,
                                        size: 30, color: Colors.white),
                                    title: const Text('Fecha Creacion'),
                                    subtitle: Text(fdt.formatDateTime(
                                        authState.usuario.fechaCreacion!))),
                              ],
                            )
                          : const CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
