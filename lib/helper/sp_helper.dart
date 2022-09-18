import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SPhelper {
  SPhelper._();
  static SPhelper sPhelper = SPhelper._();
  late SharedPreferences _prefs;
  inisit() async {
    _prefs = await SharedPreferences.getInstance();
  }

  saveToken(String token) {
    _prefs.setString('token', token);
  }

  String? getToken() {
    return _prefs.getString('token');
  }

  removeToken() {
    _prefs.remove('token');
  }

  savePhone(String phone) {
    _prefs.setString('phone', phone);
  }

  String? getPhone() {
    return _prefs.getString('phone');
  }

  removePhone() {
    _prefs.remove('phone');
  }
}
