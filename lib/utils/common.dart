import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonApp {
  static final CommonApp _shared = new CommonApp._internal();

  factory CommonApp() {
    return _shared;
  }
  CommonApp._internal();

  GlobalKey<NavigatorState> navigationKey = GlobalKey();

}