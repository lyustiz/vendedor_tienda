import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendedor_tienda/models/endpoint.dart';
import 'preferences_repository.dart';
import 'package:vendedor_tienda/models/theme.dart';

class PreferenceRepositoryImpl implements PreferencesRepository {
  static const String _themeIndexKey = 'themeIndex';
  static const String _endPointKey = 'endpointKey';

  @override
  Future<void> setTheme(Theme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeIndexKey, theme.index);
  }

  @override
  Future<Theme> getTheme() async {
    return Theme.values[2];
  }

  @override
  Future<String> getEndPoint() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String endpoint =
        prefs.getString(_endPointKey) ?? endpoints.first.url;
    return endpoint;
  }

  @override
  Future<void> setEndPoint(String empresa) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_endPointKey, empresa);
  }
}
