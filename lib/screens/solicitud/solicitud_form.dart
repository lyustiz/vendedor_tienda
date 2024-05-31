import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/solicitud/solicitud_bloc.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/entities/solicitud.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/widgets/layout/app_dialog.dart' as dlg;
import 'package:vendedor_tienda/utils/format/format_data.dart' as ft;

class SolicitudForm extends StatefulWidget {
  const SolicitudForm({super.key});

  @override
  SolicitudFormState createState() => SolicitudFormState();
}

class SolicitudFormState extends State<SolicitudForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  String tipo = 'C';
  Solicitud? solicitud;
  late Juego juego;
  int maxCantidad = 20;
  int stepCantidad = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SolicitudBloc(),
      child: BlocBuilder<SolicitudBloc, SolicitudState>(
        buildWhen: (previous, current) {
          if (current is SolicitudExito) {
            Navigator.pop(context, true);
          }
          return (current is! SolicitudExito);
        },
        builder: (context, state) {
          juego = context.read<ItemsBloc>().state.juegoSelected;

          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Agregar Solicitud',
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.chevron_left)),
            ),
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(14),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).colorScheme.primaryContainer,
                          Theme.of(context).colorScheme.primary,
                        ],
                      )),
                  child: FormBuilder(
                      enabled: (state is! SolicitudLoading),
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                'DATOS DE LA SOLICITUD',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            comboTipoSolicitud(),
                            const SizedBox(
                              height: 20,
                            ),
                            FormBuilderTextField(
                              name: 'cantidad',
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(color: Colors.amber),
                              decoration: InputDecoration(
                                labelText: 'Cantidad',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                isDense: true,
                                suffixIcon: const Icon(Icons.looks_one),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'La Cantidad es requerida'),
                                FormBuilderValidators.numeric(
                                    errorText: 'Ingresar solo numeros'),
                                FormBuilderValidators.max(maxCantidad,
                                    inclusive: true,
                                    errorText: 'Maximo Permitido $maxCantidad'),
                                (val) {
                                  final number = int.tryParse(val ?? '0');
                                  if (number == null) return null;
                                  if ((number % stepCantidad) != 0) {
                                    return 'Solicitar de $stepCantidad en $stepCantidad';
                                  }
                                  return null;
                                },
                              ]),
                            ),
                            SizedBox(
                                height: (state is SolicitudLoading) ? 30 : 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (state is SolicitudLoading)
                                      ? const LinearProgressIndicator()
                                      : null,
                                )),
                            (state is SolicitudError)
                                ? SizedBox(
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          state.error,
                                          style: const TextStyle(
                                              color: Colors.red),
                                        )))
                                : const SizedBox(),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                  onPressed: () => (state is! SolicitudLoading)
                                      ? confirm(context,
                                          context.read<SolicitudBloc>())
                                      : null,
                                  backgroundColor: Colors.green,
                                  heroTag: '2',
                                  elevation: 0,
                                  shape: const CircleBorder(
                                      side: BorderSide(
                                          color: Colors.white, width: 2)),
                                  child: const Icon(Icons.save, size: 36),
                                ),
                                FloatingActionButton(
                                    onPressed: () => onCancel(context),
                                    backgroundColor: Colors.orange,
                                    heroTag: '5',
                                    elevation: 0,
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 2)),
                                    child: const Icon(
                                      Icons.reply_sharp,
                                      size: 36,
                                    )),
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget comboTipoSolicitud() {
    final Map<String, String> tipoSolicitud = {'C': 'Cartones', 'M': 'Modulos'};

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: DropdownButton(
            style: const TextStyle(color: Colors.white, fontSize: 16),
            value: tipo,
            isDense: true,
            isExpanded: true,
            underline: const SizedBox(),
            disabledHint: const Text('No existe Promociones'),
            dropdownColor: Theme.of(context).colorScheme.secondaryContainer,
            onChanged: (String? val) {
              setState(() {
                if (val == 'M') {
                  maxCantidad = 20;
                  stepCantidad = 1;
                }
                if (val == 'C') {
                  maxCantidad = 120;
                  stepCantidad = 30;
                }
                tipo = val ?? 'M';
              });
            },
            icon: const Icon(Icons.keyboard_arrow_down),
            items: tipoSolicitud
                .map((keyMap, value) {
                  return MapEntry(
                      keyMap,
                      DropdownMenuItem(
                        value: keyMap,
                        child: Text(value),
                      ));
                })
                .values
                .toList()));
  }

  void confirm(context, solicitudBloc) async {
    final FormBuilderState? formStatus = _formKey.currentState;

    if (formStatus != null) {
      formStatus.save();
      if (formStatus.validate()) {
        int cantidad = int.parse(formStatus.value['cantidad']);
        List<Widget> content = [
          ListTile(
            title: const Text('Juego', style: TextStyle(color: Colors.white)),
            trailing: Text(
              juego.idProgramacionJuego.toString().padLeft(3, '0'),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text('Tipo Solicitud',
                style: TextStyle(color: Colors.white)),
            subtitle: Text(tipo == 'M' ? 'Modulos' : 'Cartones',
                style: const TextStyle(color: Colors.white)),
            trailing: Icon(
              tipo == 'M'
                  ? Icons.view_module_rounded
                  : Icons.table_view_rounded,
              color: Colors.greenAccent,
            ),
          ),
          ListTile(
            title:
                const Text('Cantidad', style: TextStyle(color: Colors.white)),
            subtitle:
                Text('$cantidad', style: const TextStyle(color: Colors.white)),
          ),
          ListTile(
              title: const Text('Fecha', style: TextStyle(color: Colors.white)),
              subtitle: Text(ft.formatDateTime(DateTime.now()),
                  style: const TextStyle(color: Colors.white))),
        ];
        bool? isConfirm = await dlg.appDialog(
            context, 'Confirmar Solicitud', content,
            action: 'Confirmar');

        if (isConfirm ?? false) {
          onSave(context, solicitudBloc, cantidad);
        }
      }
    }
  }

  void onSave(context, solicitudBloc, int cantidad) {
    solicitud = Solicitud.initial().copyWith(
        idProgramacionJuego: juego.idProgramacionJuego,
        tipoSolicitud: tipo,
        cantidad: cantidad,
        estado: 'P');
    solicitudBloc.add(InsertSolicitud(solicitud!));
  }

  void onCancel(BuildContext context) {
    final FormBuilderState? formStatus = _formKey.currentState;
    if (formStatus != null) {
      formStatus.reset();
    }
    Navigator.pop(context, false);
  }
}
