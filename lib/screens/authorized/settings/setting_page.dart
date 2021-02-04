import 'package:example_navigator_20/data/cubit/app_cubit.dart';
import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:example_navigator_20/screens/authorization/sign_in/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: FlatButton(
        color: Colors.blue,
        minWidth: 200,
          height: 48,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        child: Text('Logout',style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white
        )),
        onPressed: () => AppCubit.of(context).logout(context)
      ),
    );
  }
}
