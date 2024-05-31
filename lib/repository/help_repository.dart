import 'package:flutter/services.dart';
import 'dart:convert' as convert;

import 'package:vendedor_tienda/entities/help.dart';

class HelpRepository {
  Future<List> getHelpFile() async {
    String response = await rootBundle.loadString('assets/json/ayuda.json');
    return await convert.jsonDecode(response);
  }

  Future<Help> selectHelp(String screen) async {
    List json = await getHelpFile();
    Map helpJson = json.firstWhere((hlp) => hlp['pantalla'] == screen) ?? Map;
    return Help.fromJson(helpJson);
  }
}
