import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Center(
          child: InkWell(child: Text('Sign Up'),onTap: () {
            NaCubit.of(context).replace(ScreenA());
          },),
        ),
      ),
      onWillPop: () async {
        NaCubit.of(context).popValue(context, '12345');
        return Future.value(true);
      },
    );
  }
}

class ScreenA extends StatefulWidget {
  @override
  _ScreenAState createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScreenA'),
      ),
      body: Container(),
    );
  }
}

