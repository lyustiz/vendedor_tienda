import 'package:flutter/material.dart';
import 'package:vendedor_tienda/screens/carton/carton_vendido_list_screen.dart';
import 'package:vendedor_tienda/screens/carton/carton_multiple_list_screen.dart';
import 'package:vendedor_tienda/screens/carton/carton_multiple_screen.dart';
import 'package:vendedor_tienda/screens/configuracion/configuracion_screen.dart';
import 'package:vendedor_tienda/screens/estadistica/estadistica_screen.dart';
import 'package:vendedor_tienda/screens/login/login_screen.dart';
import 'package:vendedor_tienda/screens/recover/recover_screen.dart';
import 'package:vendedor_tienda/screens/home/home_screen.dart';
import 'package:vendedor_tienda/screens/solicitud/solicitud_screen.dart';
import 'package:vendedor_tienda/screens/juego/juego_list_screen.dart';
import 'package:vendedor_tienda/screens/juego/juego_screen.dart';
import 'package:vendedor_tienda/screens/carton/carton_list_screen.dart';
import 'package:vendedor_tienda/screens/carton/carton_lista.dart';
import 'package:vendedor_tienda/screens/carton/carton_screen.dart';
import 'package:vendedor_tienda/screens/carton/carton_scan.dart';
import 'package:vendedor_tienda/screens/condiciones/condiciones_screen.dart';
import 'package:vendedor_tienda/screens/help/helper_screen.dart';
import 'package:vendedor_tienda/screens/help/helper_global.dart';
import 'package:vendedor_tienda/screens/cuenta/cuenta_screen.dart';
import 'package:vendedor_tienda/screens/venta/venta_list_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => const LoginScreen(),
  'recover': (_) => const RecoverScreen(),
  'home': (_) => const HomeScreen(),
  'configuracion': (_) => const ConfiguracionScreen(),
  'juego': (_) => JuegoScreen(),
  'juego_list': (_) => const JuegoListScreen(),
  'carton_multiple_list': (_) => CartonMultipleListScreen(),
  'carton_multiple': (_) => const CartonMultipleScreen(),
  'carton_list': (_) => CartonListScreen(),
  'carton_vendido_list': (_) => const CartonVendidoListScreen(),
  'ventas_list': (_) => VentaListScreen(),
  'carton_lista': (_) => CartonListaScreen(),
  'carton': (_) => const CartonScreen(),
  'carton_scan': (_) => const CartonScan(),
  'estadistica': (_) => EstadisticaScreen(),
  'solicitud': (_) => const SolicitudScreen(),
  'condiciones': (_) => const CondicionesScreen(),
  'helper_screen': (_) => const HelperScreen(),
  'helper': (_) => const HelperGlobal(),
  'cuenta': (_) => const CuentaScreen(),
};
