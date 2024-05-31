import 'package:flutter/material.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/help_button.dart';
import 'package:vendedor_tienda/widgets/layout/logo.dart';
import 'recover_form.dart';

class RecoverScreen extends StatelessWidget {
  const RecoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: HelpButton(),
                    ),
                  ],
                ),
                const Logo(
                  titulo: 'Recuperar contraseña',
                  fontSize: 22,
                ),
                const RecoverForm(),
                TextButton(
                  onPressed: () => navigateTo(context, 'login'),
                  child: const Text('Volver'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
