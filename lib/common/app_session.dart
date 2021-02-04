import 'dart:io';

import 'package:example_navigator_20/constraints/preference_key.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AppSession {
  String token;
  static final AppSession _shared = new AppSession._internal();

  factory AppSession() {
    return _shared;
  }

  AppSession._internal() {
    init();
  }

  Box box;

  Future init() async {
    await openBox();
    token = box.get(PreferenceKey.TOKEN);
    print('token: $token');
  }

  openBox() async {
    var path = await getApplicationDocumentsDirectory();
    print('path: $path');
    if (!Hive.isBoxOpen(PreferenceKey.BOX_HIVE)) {
      Hive.init(path.path);
    }
    box = await Hive.openBox(PreferenceKey.BOX_HIVE);
  }

  bool isUserLogin() {
    return token != null;
  }

  logout() async{
    token = null;
    await box.clear();
  }

}