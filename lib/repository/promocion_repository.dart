import 'package:vendedor_tienda/entities/carton.dart';
import 'package:vendedor_tienda/models/promocion.dart';

class PromocionRepository {
  List<Promocion> listCartonesToPromocion(List<Carton> cartones) {
    List<Promocion> listPromocion = [];

    //fix error nrolinea
    bool errorLinea = cartones.isNotEmpty && cartones[0].numeroLinea == 0;

    List<String> hojasLineas = cartones
        .map((carton) => errorLinea
            ? '${carton.numero}'
            : '${carton.numeroPagina}-${carton.numeroHoja}-${carton.numeroLinea}')
        .toSet()
        .toList();

    for (String hojaLinea in hojasLineas) {
      List<Carton> cartonesLinea = cartones
          .where((c) =>
              (errorLinea
                  ? '${c.numero}'
                  : '${c.numeroPagina}-${c.numeroHoja}-${c.numeroLinea}') ==
              hojaLinea)
          .toList();
      listPromocion.add(Promocion(id: hojaLinea, cartones: cartonesLinea));
    }

    return listPromocion;
  }

  List<Promocion> updatePromocionesIndex(
    List<Promocion> promociones,
    Promocion promocion,
    int index,
  ) {
    promociones[index] = promocion;
    return promociones;
  }

  List<Promocion> updatePromocionesItem(
      List<Promocion> promociones, Promocion promocion) {
    int index = promociones.indexWhere((e) => e.id == promocion.id);
    promociones[index] = promocion;
    return promociones;
  }
}
