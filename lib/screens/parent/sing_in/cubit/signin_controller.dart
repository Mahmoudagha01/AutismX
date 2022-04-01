
import 'package:autismx/screens/parent/sing_in/cubit/singin_states.dart';
import 'package:autismx/screens/parent/sing_in/signinmodel.dart';
import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:autismx/shared/network/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginCubit extends Cubit<LoginScreenStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);
SigninModel signinModel;
void userLogin({
  @required String email,
  @required String password,
})
  {

    emit(LoginLoadingState());
    DioHelper.postData(
        url: login,
        data:
        {
          "email":email,
          "password":password,
        }
    ).then((value) {
      print(value.data['data']);
    signinModel = SigninModel.fromJson(value.data);
    print(signinModel.data.token);
      emit(LoginSuccessState());

    }).catchError((error){

      emit(LoginErrorState(error.toString()));
      print(error.toString());

    });
  }
  String Gettoken(){
  return signinModel.data.token;
}
}

var emailController=TextEditingController();

var passwordController=TextEditingController();
bool checkbox=false;
var formKey =GlobalKey<FormState>();
bool isPassword=true;
bool valueFirst=false;