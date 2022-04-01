abstract class RegisterScreenStates{}

class RegisterInitialState extends RegisterScreenStates{}

class RegisterLoadingState extends RegisterScreenStates{}

class RegisterSuccessState extends RegisterScreenStates{}

class RegisterUploadImageState extends RegisterScreenStates{}

class RegisterErrorState extends RegisterScreenStates{
  final String error;

  RegisterErrorState(this.error);
}