import 'dart:convert';

import 'package:ez_booking/model/login_response.dart';
import 'package:ez_booking/model/user_model.dart';
import 'package:ez_booking/model/verify_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static const isLogin = 'isLogin';
  static const token = 'token';
  static const userData = 'userData';
  late SharedPreferences sharedPreferences;

  static PrefUtils _instance = PrefUtils._();

  PrefUtils._();

  factory PrefUtils() => _instance;

  initSharedPrefrence() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    var result = await sharedPreferences.setString(key, value);
    return result;
  }

  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  Future<bool> setbool(String key, bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var result = await sharedPreferences.setBool(key, value);
    return result;
  }

  Future<bool> setInt(String key, int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var result = await sharedPreferences.setInt(key, value);
    return result;
  }

  Future<bool> setDouble(String key, double value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var result = await sharedPreferences.setDouble(key, value);
    return result;
  }

  Future<bool> setStringList(String key, List<String> value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var result = await sharedPreferences.setStringList(key, value);
    return result;
  }

  setToken(String token) async {
    await sharedPreferences.setString(PrefUtils.token, token);
  }
  setUser(UserModel user)async{
    await sharedPreferences.setString(PrefUtils.userData, jsonEncode(user.toJson()));
  }
 UserModel? getUser(){
  var user =  sharedPreferences.getString(PrefUtils.userData);
  if(user==null){
    return null;
  }
  return UserModel.fromJson(jsonDecode(user));
  }
}
