class Help {
  final String pantalla;
  final String texto;
  final List<HelpItem> items;

  Help({
    required this.pantalla,
    required this.texto,
    required this.items,
  });

  factory Help.fromJson(Map json) {
    List<HelpItem> items = [];
    List jsonItems = json['items'];

    for (var jsonItem in jsonItems) {
      items.add(HelpItem.fromJson(jsonItem));
    }

    return Help(pantalla: json['pantalla'], texto: json['texto'], items: items);
  }
}

class HelpItem {
  final String icono;
  final String tipo;
  final String titulo;
  final String texto;

  HelpItem({
    required this.icono,
    required this.tipo,
    required this.titulo,
    required this.texto,
  });

  factory HelpItem.fromJson(Map json) {
    return HelpItem(
        icono: json['icono'],
        tipo: json['tipo'],
        titulo: json['titulo'],
        texto: json['texto']);
  }
}
