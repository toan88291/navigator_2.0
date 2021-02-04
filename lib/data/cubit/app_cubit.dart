import 'dart:developer' as developer;
import 'package:example_navigator_20/common/app_session.dart';
import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:example_navigator_20/data/repository/app_repository.dart';
import 'package:example_navigator_20/screens/authorization/sign_in/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitState());

  static AppCubit of<T>(BuildContext context) {
    return BlocProvider.of<AppCubit>(context);
  }

  AppRepository _appRepository = AppRepository();

  void changeState(AppState state) {
    emit(state);
  }

  void logout(BuildContext context) async{
    await AppSession().logout();
    NaCubit.of(context).changeNavigator(SignIn());
  }

}