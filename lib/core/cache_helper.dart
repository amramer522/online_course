import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static late SharedPreferences _ref;


  static Future<void> init() async {
    _ref = await SharedPreferences.getInstance();
  }

  static Future<bool> saveCounter(int num) {
    return _ref.setInt("counter", num);
  }

  static int getCounter() {
    return _ref.getInt("counter") ?? 0;
  }

  static Future<bool> clear() {
    return _ref.clear();
  }

  static Future<bool> removeCounter() {
    return _ref.remove("counter");
  }

  static Future<bool> saveIfFirstTime() {
    return _ref.setBool("isFirstTime", false);
  }





  static bool getIfFirstTime() {
    return _ref.getBool("isFirstTime") ?? true;
  }

  static Future<bool> saveLang(String lang) {
    return _ref.setString("lang", lang);
  }

  static String getLang() {
    return _ref.getString("lang") ?? "ar";
  }

  static Future<bool> saveWord(String word) {
    return _ref.setString("word", word);
  }

  static String getWord() {
    return _ref.getString("word") ?? "";
  }



  static Future<bool> saveUserName(String name) {
    return _ref.setString("name", name);
  }

  static String getName() {
    return _ref.getString("name") ?? "";
  }

}
