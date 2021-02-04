import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:example_navigator_20/screens/authorization/sign_in/sign_in_cubit.dart';
import 'package:example_navigator_20/screens/authorization/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> key = GlobalKey();

  final cubit = SignInCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      cubit: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Sign In'),
          ),
          body: Form(
            key: key,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(28),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FlutterLogo(
                      size: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'User name',filled: true),
                      validator: (value) => cubit.validateUser(value),
                    ),
                    if(state.dataSignIn.errorUser.isNotEmpty) Container(
                      padding: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state?.dataSignIn?.errorUser ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password',filled: true),
                      validator: (value) => cubit.validatePass(value),
                      obscureText: true,
                    ),
                    if(state.dataSignIn.errorPass.isNotEmpty) Container(
                      padding: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state?.dataSignIn?.errorPass ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    FlatButton(
                      onPressed: () => onLogin(),
                      minWidth: double.infinity,
                      height: 48,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      color: Colors.blue,
                      child: state.dataSignIn.isLoading
                          ? CircularProgressIndicator(backgroundColor: Colors.white,)
                          : Text(
                              'Login',
                              style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if(state.dataSignIn.messageError.isNotEmpty) Container(
                      padding: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.center,
                      child: Text(
                        state?.dataSignIn?.messageError ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () => NaCubit.of(context).pushThen(SignUp()),
                      minWidth: double.infinity,
                      height: 48,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      color: Colors.blue,
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  onLogin() {
    if (key.currentState.validate()) {
      cubit.doLogin(context);
    }
  }
}
