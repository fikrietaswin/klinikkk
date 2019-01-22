import 'package:shared_preferences/shared_preferences.dart';

  setString(String key, String value)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  setInt(String key, int value)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? '';
  }

    Future<int> getInt(String key)async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? 0;
  }