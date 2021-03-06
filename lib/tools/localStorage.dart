import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' show json;

/// 设置本地储存
setLocalStorage(String key, dynamic value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value is String) {
    prefs.setString(key, value);
  } else if (value is Map) {
    prefs.setString(key, value.toString());
  }
}

/// 获取本地储存
Future getLocalStorage(String key, [String type = '']) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String res = prefs.getString(key);
  if (type == 'object') {
    return json.decode(res);
  }
  return res;
}

clearLocalStorage(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (key.isEmpty) {
    prefs.clear();
  } else {
    prefs.remove(key);
  }
}
