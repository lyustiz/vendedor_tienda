import 'package:vendedor_tienda/entities/carton.dart';

class Promocion {
  final String id;
  final List<Carton> cartones;
  bool isSelected = false;
  bool isExpanded = false;

  Promocion(
      {required this.id,
      required this.cartones,
      this.isSelected = false,
      this.isExpanded = false});

  Promocion copyWith({
    String? id,
    List<Carton>? cartones,
    bool? isSelected,
    bool? isExpanded,
  }) =>
      Promocion(
        id: id ?? this.id,
        cartones: cartones ?? this.cartones,
        isSelected: isSelected ?? this.isSelected,
        isExpanded: isExpanded ?? this.isExpanded,
      );
}
