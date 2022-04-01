abstract class LoginScreenStates{}

class LoginInitialState extends LoginScreenStates{}

class LoginLoadingState extends LoginScreenStates{}

class LoginSuccessState extends LoginScreenStates{}

class LoginErrorState extends LoginScreenStates{
  final String error;

  LoginErrorState(this.error);
}