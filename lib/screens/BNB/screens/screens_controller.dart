import 'package:autismx/screens/BNB/activity/activity.dart';
import 'package:autismx/screens/BNB/advice/advice_view.dart';
import 'package:autismx/screens/BNB/home/home_view.dart';
import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/screens/parent/sing_in/signinmodel.dart';
import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:autismx/shared/network/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../predict/predict.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          "assets/images/predict1.png",
        ),
      ),
      label: "Predict",
    ),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/advice1.png"),
        ),
        label: "Advices"),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/games.png"),
        ),
        label: "Activity"),
  ];

  final List screens = [
    const Home(),
    const Predict(),
    const Advices(),
    const Activity()
  ];
 SigninModel signinModel;
 List<dynamic> AdvicesList = [];

  void getAdvices()
  {
    emit(GetAdvicesLoadingState());

    DioHelper.getData(
      url: advices_link,
      //${signinModel.data.token}
      token:"bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXV0aXNteC5uZXRcL2FwaVwvcGFyZW50X2xvZ2luIiwiaWF0IjoxNjUxNzA4MzExLCJleHAiOjE2NTE3MTE5MTEsIm5iZiI6MTY1MTcwODMxMSwianRpIjoiaFJ5UTcxRnNobUZiYVVzSSIsInN1YiI6NDUsInBydiI6IjM0MGUxNzZmMWIzOGUyOWU5MjVlNzNhNWFjOTRiN2E5ODM5ZWI5NDAifQ.Vwhq4sP1y6sxR3rpivbWlxLqfzWNTYX41YTy2pO-NdU",
    ).then((value)
    {
     print(value.data["data"]);
      AdvicesList = value.data["data"];
      ///print(business[0]['title']);

      emit(GetAdvicesSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetAdvicesErrorState(error.toString()));
    });
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
      if(index == 2) {
        getAdvices();
      }
    emit(AppBottomNavState());
  }
}

