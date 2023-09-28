import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Adding an Bool value
dynamic putBool(key, val) async {
  Future _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setBool("$key", val);
  return _res;
}

/// Adding a string value
dynamic putString(key, val) async {
  Future _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var _res = prefs.setString("$key", val);
  return _res;
}

/// Adding a list or object
/// Use import 'dart:convert'; for jsonEncode
dynamic putJson(key, val) async {
  Future _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  var valString = jsonEncode(val);
  var _res = prefs.setString("$key", valString);
  return _res;
}

/// Get Bool value
/// Argument [key]
Future<bool?> getBool(key) async {
  Future _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  bool? _res = prefs.getBool("$key");
  return _res;
}

/// Get string value
/// Argument [key]
dynamic getString(key) async {
  Future _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String? _res = prefs.getString("$key");
  return _res;
}

/// Get list or object
/// Use import 'dart:convert'; for jsonEncode
/// Argument [key]
dynamic getJson(key) async {
  Future _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  String? jsonString = prefs.getString("$key");
  if (jsonString != null) {
    var _res = jsonDecode(jsonString);
    return _res;
  } else
    return null;
}

RemoveStoreData(key) async {
  Future _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = await _prefs;
  prefs.remove("$key");
}
