part of 'sign_in_cubit.dart';

abstract class SignInState {
  DataSignIn dataSignIn;

  SignInState({this.dataSignIn});
}

class InitState extends SignInState {
  InitState() : super(dataSignIn: DataSignIn(isLoading: false,errorPass: '',errorUser: '',messageError: ''));
}

class ValidateState extends SignInState {
  ValidateState(DataSignIn dataSignIn) : super(dataSignIn: dataSignIn);
}

class LoadingState extends SignInState {
  LoadingState(DataSignIn dataSignIn) : super(dataSignIn: dataSignIn);
}

class FinishState extends SignInState {
  FinishState() : super();
}

class ErrorState extends SignInState {
  ErrorState(DataSignIn copyWith) : super(dataSignIn: copyWith);
}

class DataSignIn {
  bool isLoading;
  String userName, passWord;
  String errorUser, errorPass;
 String messageError;
  DataSignIn(
      {this.isLoading,
        this.userName,
        this.passWord,
        this.errorPass,
        this.messageError,
        this.errorUser});

  DataSignIn copyWith(
      {bool isLoading,
        String userName,
        String passWord,
        String messageError,
        String errorUser,
        String errorPass}) =>
      DataSignIn(
          isLoading: isLoading ?? this.isLoading,
          userName: userName ?? this.userName,
          passWord: passWord ?? this.passWord,
          errorPass: errorPass ?? this.errorPass,
          messageError: messageError ?? this.messageError,
          errorUser: errorUser ?? this.errorUser);
}
