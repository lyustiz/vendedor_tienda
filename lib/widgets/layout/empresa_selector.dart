import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:vendedor_tienda/blocs/preferences/preferences_bloc.dart';
import 'package:vendedor_tienda/entities/endpoint.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';

class EmpresaSelector extends StatelessWidget {
  final EndPoint endPoint;
  const EmpresaSelector({super.key, required this.endPoint});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is PreferenceLoaded) {
          BlocProvider.of<PreferencesBloc>(context)
              .add(UpdateEndPoint(endPoint.url));
          return Container(
              padding: const EdgeInsets.only(top: 18, bottom: 18),
              child: Column(
                children: [
                  empresaSelected(context, endPoint),
                  const SizedBox(height: 10),
                  returnButton(context),
                ],
              ));
        } else {
          return const Icon(Icons.light_mode_sharp);
        }
      },
    );
  }

  Widget empresaSelected(context, EndPoint endPoint) {
    return FormBuilderTextField(
      name: 'Nombre',
      initialValue: endPoint.empresa,
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.apartment_rounded),
        labelText: 'Empresa',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        isDense: true,
      ),
    );
  }

  Widget returnButton(context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        child: const Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.undo), Text('Volver a Login')],
          ),
        ),
        onPressed: () => pushScreen(context, 'login'));
  }

  Widget comboEmpresaEndpoint(context, String endpoint, EndPoint endPoint) {
    EndPoint? empresa = endpoints.firstWhere((ep) => ep.url == endpoint);

    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(value: endPoint.url, child: Text(endPoint.empresa))
    ];

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: DropdownButton(
            style: const TextStyle(color: Colors.white, fontSize: 18),
            value: empresa.url,
            underline: null,
            isExpanded: true,
            dropdownColor: Theme.of(context).colorScheme.secondary,
            onChanged: (String? url) {
              BlocProvider.of<PreferencesBloc>(context)
                  .add(UpdateEndPoint(url!));
            },
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items));
  }
}
