import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:example_navigator_20/screens/authorization/sign_in/sign_in_cubit.dart';
import 'package:example_navigator_20/screens/authorization/sign_up/sign_up.dart';
import 'package:example_navigator_20/utils/push_notice.dart';
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
    return BlocConsumer<SignInCubit, SignInState>(
      cubit: cubit,
      listener: (context,state) {
        if (state is ErrorState) {
          KPushNotice.show(context, state.dataSignIn.messageError, 'Error');
        }
      },
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
                      onSaved: (value) => cubit.saveUser(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password',filled: true),
                      onSaved: (value) => cubit.savePass(value),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    if (state.dataSignIn.errorText.isNotEmpty) Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      width: double.infinity,
                      child: Text(
                        state.dataSignIn.errorText,
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
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
    FocusScope.of(context).requestFocus(FocusNode());
    key.currentState.save();
    cubit.doLogin(context);
  }
}
