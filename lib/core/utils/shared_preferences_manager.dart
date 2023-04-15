import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> save(String key, String valor) async {
    final pref = await _getInstance();
    await pref.setString(key, valor);
  }

  Future<String?> get(String key) async {
    final pref = await _getInstance();
    return pref.getString(key);
  }

  Future<void> remove(String key) async {
    final pref = await _getInstance();
    await pref.remove(key);
  }

  Future<bool> verify(String key) async {
    final pref = await _getInstance();
    return pref.containsKey(key);
  }
}
