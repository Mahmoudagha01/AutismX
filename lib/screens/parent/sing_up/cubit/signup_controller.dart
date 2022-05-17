import 'dart:io';

import 'package:autismx/screens/parent/sing_up/cubit/singup_states.dart';
import 'package:autismx/shared/models/signupmodel.dart';
import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:autismx/shared/network/dio/profile_helper.dart';
import 'package:autismx/shared/network/end_point.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterScreenStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  SignupModel signupModel;

  void userRegister({
    @required String firstName,
    @required String lastName,
    @required String address,
    @required String phone,
    @required String email,
    @required String password,
    @required String childName,
    @required int childAge,
    @required int childGender,
  }) {
    emit(RegisterLoadingState());
    ProfileDioHelper.register(
      firstName: firstName,
      lastName: lastName,
      address: address,
      phone: phone,
      email: email,
      password: password,
      childName: childName,
      childAge: childAge,
      childGender: childGender,
      childImageFile: file,
    ).then((value) {
      print(value.data);
      signupModel = SignupModel.fromJson(value.data);
      emit(RegisterSuccessState(signupModel));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print(error.toString());
    });
  }

  // this was a try to add an image picker into the formField but it didn't work
  File file;

  Future uploadChildImage() async {
    ImagePicker picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);

    file = File(image.path);

    emit(RegisterUploadImageState(image.path));
  }
}
