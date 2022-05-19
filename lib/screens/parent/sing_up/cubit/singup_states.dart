import 'package:autismx/shared/models/signupmodel.dart';

abstract class RegisterScreenStates {}

class RegisterInitialState extends RegisterScreenStates {}

class RegisterLoadingState extends RegisterScreenStates {}

class RegisterSuccessState extends RegisterScreenStates {
  final SignupModel signupModel;
  RegisterSuccessState(this.signupModel);
}

class RegisterUploadImageState extends RegisterScreenStates {
  final String imagePath;
  RegisterUploadImageState(this.imagePath);
}

class RegisterErrorState extends RegisterScreenStates {
  final String error;

  RegisterErrorState(this.error);
}
