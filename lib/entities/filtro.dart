import 'package:flutter/material.dart';

enum TipoFiltro { ninguno, activo, inactivo, vendido, disponible }

class Filtro {
  final TipoFiltro filtro;
  final IconData icon;
  final Color color;
  final String name;
  Filtro(
      {required this.filtro,
      required this.icon,
      required this.color,
      required this.name});

  static Filtro getFiltro(TipoFiltro pfiltro) {
    List<Filtro> filtroData = [
      Filtro(
          filtro: TipoFiltro.ninguno,
          icon: Icons.filter_none,
          color: Colors.grey,
          name: 'Sin Filtro'),
      Filtro(
          filtro: TipoFiltro.activo,
          icon: Icons.check,
          color: Colors.green,
          name: 'Activo'),
      Filtro(
          filtro: TipoFiltro.inactivo,
          icon: Icons.close,
          color: Colors.red,
          name: 'Inactivo'),
      Filtro(
          filtro: TipoFiltro.vendido,
          icon: Icons.payment,
          color: Colors.orange,
          name: 'Vendido'),
      Filtro(
          filtro: TipoFiltro.disponible,
          icon: Icons.free_breakfast,
          color: Colors.blue,
          name: 'Disponible'),
    ];

    return filtroData.firstWhere((element) => element.filtro == pfiltro);
  }

  @override
  String toString() => 'Filtros $filtro';
}
