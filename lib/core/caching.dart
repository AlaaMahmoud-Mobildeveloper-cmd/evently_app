import 'package:shared_preferences/shared_preferences.dart';

class CachingHelper{
  static late final SharedPreferences prefs;

  static Future<void> initial()async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveCaching(bool flag) async{
    return await prefs.setBool("caching", flag);
  }

  static bool? getCaching(String key) {
    return prefs.getBool(key);
  }

}