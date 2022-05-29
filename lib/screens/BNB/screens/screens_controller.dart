import 'package:autismx/screens/BNB/activity/activity.dart';
import 'package:autismx/screens/BNB/advice/advice_view.dart';
import 'package:autismx/screens/BNB/home/home_view.dart';
import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/shared/network/dio/centers_helper.dart';
import 'package:autismx/shared/network/dio/parent_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../predict/predict.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  final List screens = [
    const Home(),
    const Predict(),
    const Advices(),
    const Activity()
  ];
  List<dynamic> AdvicesList = [];
  List<dynamic> CentersList = [];

  void getAdvices() {
    emit(GetAdvicesLoadingState());

    ParentDioHelper.showAdvices().then((value) {
      print(value.data["data"]);
      AdvicesList = value.data["data"];

      ///print(business[0]['title']);

      emit(GetAdvicesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAdvicesErrorState(error.toString()));
    });
  }

  void getCenters() {
    emit(GetAdvicesLoadingState());

    CentersDioHelper.showAllCenters().then((value) {
      print(value.data["data"]);
      CentersList = value.data["data"];

      ///print(business[0]['title']);

      emit(GetCentersSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCentersErrorState(error.toString()));
    });
  }

  void changeBottomNavBar(int index) {
    if (index == 0) {
      getCenters();
    }
    if (index == 2) {
      getAdvices();
    }
    emit(AppBottomNavState());
  }
}
