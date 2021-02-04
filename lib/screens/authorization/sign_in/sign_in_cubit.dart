import 'package:example_navigator_20/common/app_session.dart';
import 'package:example_navigator_20/constraints/preference_key.dart';
import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:example_navigator_20/data/model/sign_in/login_params.dart';
import 'package:example_navigator_20/data/model/sign_in/login_response.dart';
import 'package:example_navigator_20/data/repository/app_repository.dart';
import 'package:example_navigator_20/screens/authorized/main_app.dart';
import 'package:example_navigator_20/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  AppRepository _appRepository = AppRepository();

  SignInCubit() : super(InitState());

  String validateUser(String user) {
    if (!validateUserName(user)) {
      emit(ValidateState(state.dataSignIn.copyWith(errorUser: 'Error user')));
      return '';
    }
    emit(ValidateState(state.dataSignIn.copyWith(errorUser: '', userName: user,messageError: '')));
    return null;
  }

  String validatePass(String pass) {
    if (!validatePassword(pass)) {
      emit(ValidateState(state.dataSignIn.copyWith(errorPass: 'Error pass')));
      return '';
    }
    emit(ValidateState(state.dataSignIn.copyWith(errorPass: '', passWord: pass,messageError: '')));
    return null;
  }

  Future<void> doLogin(BuildContext context) async {
    emit(LoadingState(state.dataSignIn.copyWith(isLoading: true,messageError: '')));
    final resultLogin = await _appRepository.signIn(
        LoginParams(
            username: state.dataSignIn.userName,
            password:  state.dataSignIn.passWord
        ).toJson()
    );
    emit(LoadingState(state.dataSignIn.copyWith(isLoading: false)));
    if (resultLogin.code == 200) {
      LoginResponse response = LoginResponse.fromJson(resultLogin.data);
      AppSession().box.put(PreferenceKey.TOKEN, response.access);
      AppSession().token = response.access;
      NaCubit.of(context).replace(MainApp());
    } else {
      emit(ErrorState(state.dataSignIn.copyWith(messageError: resultLogin.message)));
    }
  }

}

