import 'package:flutter/material.dart';

enum Estatus {
  venta,
  ventaSelected,
  devolucion,
  vendido,
  cerrado,
  entregado,
  cerradoHora
}

class EstatusVenta {
  final Estatus status;
  final IconData icon;
  final Color color;
  final String name;
  EstatusVenta(
      {required this.status,
      required this.icon,
      required this.color,
      required this.name});

  static EstatusVenta getEstatusVenta(Estatus pEstatus) {
    List<EstatusVenta> estatusData = [
      EstatusVenta(
          status: Estatus.venta,
          icon: Icons.attach_money_rounded,
          color: Colors.green,
          name: 'Venta'),
      EstatusVenta(
          status: Estatus.ventaSelected,
          icon: Icons.check,
          color: Colors.blue,
          name: 'Venta Seleccionado'),
      EstatusVenta(
          status: Estatus.entregado,
          icon: Icons.lock,
          color: Colors.red,
          name: 'Entregado'),
      EstatusVenta(
          status: Estatus.vendido,
          icon: Icons.attach_money_rounded,
          color: Colors.amber,
          name: 'Vendido'),
      EstatusVenta(
          status: Estatus.devolucion,
          icon: Icons.reply,
          color: Colors.red,
          name: 'Devolucion'),
      EstatusVenta(
          status: Estatus.cerrado,
          icon: Icons.lock,
          color: Colors.orange,
          name: 'Cerrado'),
      EstatusVenta(
          status: Estatus.cerradoHora,
          icon: Icons.lock_clock,
          color: Colors.red,
          name: 'CerradoHora')
    ];

    return estatusData.firstWhere((element) => element.status == pEstatus);
  }
}
