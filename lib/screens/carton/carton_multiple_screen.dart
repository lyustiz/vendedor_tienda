import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vendedor_tienda/blocs/auth/auth_bloc.dart';
import 'package:vendedor_tienda/blocs/enviocartones/enviocartones_bloc.dart';
import 'package:vendedor_tienda/blocs/items/items_bloc.dart';
import 'package:vendedor_tienda/blocs/ventacartones/ventacartones_bloc.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/juego.dart';
import 'package:vendedor_tienda/screens/carton/witget/cartones_arguments.dart';
import 'package:vendedor_tienda/screens/carton/witget/etiqueta.dart';
import 'package:vendedor_tienda/utils/route_helper.dart';
import 'package:vendedor_tienda/widgets/layout/app_container.dart';
import 'package:vendedor_tienda/widgets/layout/app_title_bar_variant.dart';
import 'package:vendedor_tienda/widgets/layout/app_scaffold.dart';
import 'package:vendedor_tienda/screens/carton/witget/carton_container.dart';
import 'package:vendedor_tienda/screens/carton/witget/valor_venta.dart';
import 'package:vendedor_tienda/screens/carton/witget/vender_button.dart';
import 'package:vendedor_tienda/widgets/layout/app_message.dart' as msg;
import 'package:vendedor_tienda/widgets/layout/app_dialog.dart' as dlg;
import 'package:vendedor_tienda/utils/format/format_data.dart' as ft;

class CartonMultipleScreen extends StatefulWidget {
  const CartonMultipleScreen({super.key});

  @override
  State<CartonMultipleScreen> createState() => _CartonMultipleScreenState();
}

class _CartonMultipleScreenState extends State<CartonMultipleScreen> {
  late int idUsuario;
  late int idVenta;
  late Juego juego;
  late bool esPromocion;
  late bool sinCorreo = false;
  late bool sinTelefono = false;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected;
    esPromocion = juego.cartonesPromocion > 1;

    AuthState authState = context.read<AuthBloc>().state;
    if (authState is AuthLogged) {
      idUsuario = authState.usuario.idUsuario;
    }
    final CartonesArguments params =
        ModalRoute.of(context)!.settings.arguments as CartonesArguments;
    final List<Carton> cartones = params.cartones;

    return MultiBlocProvider(
      providers: [
        BlocProvider<VentaCartonesBloc>(
          create: (BuildContext context) => VentaCartonesBloc(),
        ),
        BlocProvider<EnviocartonesBloc>(
          create: (BuildContext context) => EnviocartonesBloc(),
        ),
      ],
      child: BlocConsumer<VentaCartonesBloc, VentaCartonesState>(
        listener: (context, stateVenta) {
          if (stateVenta is VentaCartonesExito) {
            msgAction('success', stateVenta.mensaje);
          }

          if (stateVenta is VentaCartonesError) {
            msgAction('error', stateVenta.error);
          }

          if (stateVenta is VentaCartonesRefresh) {
            context.read<VentaCartonesBloc>().add(VentaCartonesInit());
          }
        },
        builder: (context, stateVenta) {
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title:
                  'Juego ${juego.idProgramacionJuego} - Cart. ${cartones.length}',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'carton_multiple_list'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'carton',
            ),
            child: SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.primaryContainer
                          ],
                        ),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 235,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cartones.length,
                          itemBuilder: (context, index) {
                            Carton carton = cartones[index];
                            return SizedBox(
                                width: 220,
                                child: Stack(children: [
                                  CartonContainer(
                                    carton: carton,
                                    tipojuego: juego.tipoJuego,
                                    encabezado: juego.encabezadoCartones,
                                  ),
                                  Positioned(
                                    top: 3,
                                    left: 65,
                                    right: 65,
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: Colors.white),
                                        child: Text(
                                          '${carton.numero}'.padLeft(4, '0'),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        )),
                                  ),
                                ]));
                          }),
                    ),
                    AppContainer(
                        variant: 'secondary', child: clienteForm(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        esPromocion
                            ? Etiqueta(
                                texto: 'Promocion ${juego.cartonesPromocion}x1')
                            : const SizedBox(height: 0),
                        const SizedBox(height: 3),
                        ValorVenta(
                          valor: juego.valorCarton /
                              juego.cartonesPromocion *
                              cartones.length,
                          moneda: juego.moneda,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    (stateVenta is VentaCartonesExito)
                        ? Column(
                            children: [
                              BlocConsumer<EnviocartonesBloc,
                                      EnviocartonesState>(
                                  listener: (contextEC, stateEC) {
                                if (stateEC is EnviocartonesExito) {
                                  msgAction('success', stateEC.mensaje);
                                }

                                if (stateEC is EnviocartonesError) {
                                  msgAction('error', stateEC.error);
                                }
                              }, builder: (contextEC, stateEC) {
                                idVenta = stateVenta.idVenta;
                                return Column(
                                  children: [
                                    (stateEC is EnviocartonesLoading)
                                        ? const LinearProgressIndicator()
                                        : Container(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FloatingActionButton(
                                            onPressed: () => sinCorreo
                                                ? null
                                                : sendMail(context, idVenta),
                                            backgroundColor: sinCorreo
                                                ? Colors.grey
                                                : Colors.blue,
                                            heroTag: 'btn-mail',
                                            child: const Icon(
                                              Icons.email,
                                              color: Colors.white,
                                            )),
                                        FloatingActionButton(
                                            onPressed: () => sinTelefono
                                                ? null
                                                : sendWhatsApp(
                                                    context, idVenta),
                                            backgroundColor: sinTelefono
                                                ? Colors.grey
                                                : Colors.green,
                                            heroTag: 'btn-whsp',
                                            child: const Icon(
                                              Icons.phone_forwarded_sharp,
                                              color: Colors.white,
                                            )),
                                        FloatingActionButton(
                                            onPressed: () =>
                                                returnList(context),
                                            backgroundColor: Colors.orange,
                                            heroTag: 'btn-retn',
                                            child: const Icon(
                                              Icons.reply_sharp,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            ],
                          )
                        : Container(),
                    (stateVenta is VentaCartonesLoading)
                        ? const CircularProgressIndicator()
                        : Container(),
                    (stateVenta is VentaCartonesInitial)
                        ? GestureDetector(
                            onTap: () {
                              final FormBuilderState? formStatus =
                                  _formKey.currentState;
                              if (formStatus != null) {
                                formStatus.save();
                                if (formStatus.validate()) {
                                  String nombreCliente =
                                      formStatus.value['nombreCliente'];
                                  String correoCliente = sinCorreo
                                      ? ''
                                      : formStatus.value['correoCliente'];
                                  String telefonoCliente = sinTelefono
                                      ? ''
                                      : formStatus.value['telefonoCliente'];

                                  return confirm(
                                      context,
                                      cartones,
                                      nombreCliente,
                                      correoCliente,
                                      telefonoCliente);
                                }
                              }
                            },
                            child: const VenderButton(),
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget clienteForm(BuildContext context) {
    VentaCartonesState state = context.read<VentaCartonesBloc>().state;

    return FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'nombreCliente',
              enabled: state is! VentaCartonesExito,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                labelText: 'Nombre Cliente',
                labelStyle: const TextStyle(color: Colors.amber),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                isDense: true,
                suffixIcon: const Icon(Icons.portrait),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Se requiere el nombre del cliente'),
                FormBuilderValidators.minLength(3,
                    errorText:
                        'Se requiere de almenos 3 caracteres en el nombre')
              ]),
            ),
            const SizedBox(height: 9),
            FormBuilderTextField(
              name: 'correoCliente',
              enabled: !sinCorreo && state is! VentaCartonesExito,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                labelText: sinCorreo ? 'Sin Correo' : 'Correo',
                labelStyle: const TextStyle(color: Colors.amber),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                isDense: true,
                suffixIcon: const Icon(Icons.email),
              ),
              validator: FormBuilderValidators.compose([
                (val) {
                  if (!sinCorreo) {
                    if (val?.isEmpty ?? false) {
                      return 'Se requiere el correo del cliente';
                    }
                  }
                  return null;
                },
                FormBuilderValidators.email(errorText: 'Correo Invalido'),
              ]),
            ),
            const SizedBox(height: 9),
            FormBuilderTextField(
              name: 'telefonoCliente',
              enabled: !sinTelefono && state is! VentaCartonesExito,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: const TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                labelText: sinTelefono ? 'Sin Celular' : 'Celular',
                labelStyle: const TextStyle(color: Colors.amber),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                isDense: true,
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '(${juego.prefijoTelefonico})',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
                suffixIcon: const Icon(Icons.phone_android),
              ),
              validator: FormBuilderValidators.compose([
                (val) {
                  if (!sinTelefono) {
                    if (val?.isEmpty ?? false) {
                      return 'Se requiere el celular del cliente';
                    }
                  }
                  return null;
                },
                FormBuilderValidators.numeric(errorText: 'Celular Invalido'),
              ]),
            ),
            (state is VentaCartonesExito)
                ? const SizedBox(height: 0)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sin Correo',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Switch(
                        value: sinCorreo,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (value) {
                          sinCorreo = !sinCorreo;
                          var form = _formKey.currentState!;
                          form.fields['correoCliente']!.reset();
                          context.read<VentaCartonesBloc>().add(SetCartones());
                        },
                      ),
                      const Text(
                        'Sin Celular',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Switch(
                        value: sinTelefono,
                        activeColor: Theme.of(context).colorScheme.primary,
                        onChanged: (value) {
                          sinTelefono = !sinTelefono;
                          var form = _formKey.currentState!;
                          form.fields['telefonoCliente']!.reset();
                          context.read<VentaCartonesBloc>().add(SetCartones());
                        },
                      )
                    ],
                  ),
          ],
        ));
  }

  void confirm(
      BuildContext context,
      List<Carton> cartones,
      String nombreCliente,
      String correoCliente,
      String telefonoCliente) async {
    String textoResumen = esPromocion
        ? 'Promocion ${juego.cartonesPromocion}x1'
        : '${cartones.length} x ${juego.valorCarton}';
    double valorTotal =
        juego.valorCarton * (cartones.length / juego.cartonesPromocion);
    String textoTotal = ' a Pagar: ${ft.formatNumber(valorTotal)}';

    List<Widget> content = [
      ListTile(
        dense: true,
        title: const Text('Cliente'),
        subtitle: Text(nombreCliente),
      ),
      ListTile(
        dense: true,
        title: const Text('Correo'),
        subtitle: Text(correoCliente),
      ),
      ListTile(
        dense: true,
        title: const Text('Celular'),
        subtitle: Text('(${juego.prefijoTelefonico})$telefonoCliente'),
      ),
      ListTile(
        dense: true,
        title: const Text('Juego'),
        subtitle: Text(
          '${juego.idProgramacionJuego.toString().padLeft(3, '0')} - ${ft.formatDate(DateTime.now())}',
        ),
      ),
      ListTile(
        dense: true,
        title: const Text('Total a Pagar'),
        subtitle: Text(
          '$textoResumen $textoTotal',
        ),
      ),
    ];

    bool? isConfirm = await dlg.appDialog(context, 'Confirmar Venta', content,
        action: 'Vender');

    if (isConfirm ?? false) {
      onSave(context, cartones, nombreCliente, correoCliente, telefonoCliente);
    }
  }

  void onSave(BuildContext context, List<Carton> cartones, String nombreCliente,
      String correoCliente, String telefonoCliente) {
    List<int> idCartones = cartones.map((c) => c.idCarton).toList();
    int idVendedor = cartones.first.idVendedor;

    context.read<VentaCartonesBloc>().add(VenderCartones(
        juego.idProgramacionJuego,
        idVendedor,
        nombreCliente,
        correoCliente,
        telefonoCliente,
        idCartones));
  }

//action post-venta
  void msgAction(String type, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(msg.appMessage(context, type, message));
  }

  void returnList(context) {
    navigateTo(context, 'carton_multiple_list');
  }

  void sendMail(BuildContext context, int idVental) {
    context.read<EnviocartonesBloc>().add(EnvioCartonesCorreo(idVental));
  }

  void sendWhatsApp(BuildContext context, int idVental) {
    context.read<EnviocartonesBloc>().add(EnvioCartonesWhatsapp(idVental));
  }
}
