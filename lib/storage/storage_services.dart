import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  saveData({required String key, required var value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case String:
        prefs.setString(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
      case List<String>:
        prefs.setStringList(key, value);
        break;
    }
  }

  readData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  get title => 'title';
  get imgUrl => 'imgUrl';
  get price => 'price';
}
