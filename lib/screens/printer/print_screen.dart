import 'package:flutter/material.dart';
import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/entities/cliente.dart';
import 'package:vendedor_tienda/entities/juego.dart';
//import 'package:vendedor_tienda/utils/format/format_data.dart' as Ft;
//print
import 'dart:async';
/*import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';*/

class CartonScreen extends StatefulWidget {
  const CartonScreen({super.key});

  @override
  State<CartonScreen> createState() => _CartonScreenState();
}

class _CartonScreenState extends State<CartonScreen> {
  Cliente? cliente;
  late Carton carton;
  late Juego juego;
  // BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  // bool _connected = false;
  String tips = 'no device connect';

  @override
  void initState() {
    super.initState();

    //WidgetsBinding.instance.addPostFrameCallback((_) => initBluetooth());
  }

  @override
  Widget build(BuildContext context) {
    return const Text('data');
  }

  Future<void> initBluetooth() async {
    // bluetoothPrint.startScan(timeout: Duration(seconds: 4));

    //bool isConnected = await bluetoothPrint.isConnected;

    /* bluetoothPrint.state.listen((state) {
      // print('cur device status: $state');

      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });*/

    if (!mounted) return;

    /* if (isConnected) {
      setState(() {
        _connected = true;
      });
    } */
  }

  void printCard() async {
    // bool isConnected = await bluetoothPrint.isConnected;

    /*bluetoothPrint.state.listen((state) {
      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
            tips = 'connect success';
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
            tips = 'disconnect success';
          });
          break;
        default:
          break;
      }
    });

    if (!mounted) return;

    /*  if (isConnected) {
      setState(() {
        _connected = true;
      });
    } */
  }*/

    void print(contexto, Juego juego, Carton Carton) async {
      // Map<String, dynamic> config = Map();
      /* List<LineText> list = [];
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: 'BINGO JL',
        size: 18,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 0));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: '${Ft.formatDateTime(DateTime.now())}',
        size: 10,
        weight: 0,
        align: LineText.ALIGN_RIGHT,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: 'Juego ${juego.idJuego.toString().padLeft(3, '0')}',
        size: 10,
        align: LineText.ALIGN_LEFT,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: '${Ft.formatDateTime(juego.fechaProgramada)}',
        size: 10,
        align: LineText.ALIGN_LEFT,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: '${carton.serie}',
        size: 10,
        align: LineText.ALIGN_LEFT,
        linefeed: 1));
    list.add(LineText(linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: 'Carton ${carton.numeroSerie}',
        size: 11,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1));
    list.add(LineText(linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: '${carton.p1}',
        size: 18,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: '${carton.p2} ${carton.p3} ${carton.p4}',
        size: 18,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content:
            '${carton.p5}  ${carton.p6} ${carton.p7} ${carton.p9} ${carton.p9} ${carton.p10}  ${carton.p11}',
        size: 18,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content:
            '${carton.p12} ${carton.p13} ${carton.p14} ${carton.p15} ${carton.p16}',
        size: 18,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: '${carton.p17} ${carton.p18} ${carton.p19}',
        size: 18,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: '${carton.p20}',
        size: 18,
        weight: 1,
        align: LineText.ALIGN_CENTER,
        linefeed: 1));
    list.add(LineText(linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: 'Vendedor: Javier Forero',
        size: 10,
        weight: 1,
        align: LineText.ALIGN_LEFT,
        linefeed: 1));
    list.add(LineText(
        type: LineText.TYPE_TEXT,
        content: 'Cliente:  Cliente Prueba',
        size: 10,
        weight: 1,
        align: LineText.ALIGN_LEFT,
        linefeed: 1));
    await bluetoothPrint.printReceipt(config, list);*/
    }
  }
}
