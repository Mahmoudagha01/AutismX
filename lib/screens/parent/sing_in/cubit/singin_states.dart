import 'package:autismx/shared/models/signinmodel.dart';

abstract class LoginScreenStates {}

class LoginInitialState extends LoginScreenStates {}

class LoginLoadingState extends LoginScreenStates {}

class LoginSuccessState extends LoginScreenStates {
  final SigninModel signinModel;
  LoginSuccessState(this.signinModel);
}

class LoginErrorState extends LoginScreenStates {
  final String error;

  LoginErrorState(this.error);
}
