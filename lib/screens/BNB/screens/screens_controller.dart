// import 'package:autismx/screens/BNB/activity/activity.dart';
// import 'package:autismx/screens/BNB/advice/advice_view.dart';
// import 'package:autismx/screens/BNB/home/home_view.dart';
// import 'package:autismx/screens/BNB/screens/appstates.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../shared/models/signinmodel.dart';
// import '../predict/predict.dart';
import 'package:autismx/screens/BNB/activity/activity.dart';
import 'package:autismx/screens/BNB/advice/advice_view.dart';
import 'package:autismx/screens/BNB/home/home_view.dart';
import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/shared/network/dio/parent_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../predict/predict.dart';

// class AppCubit extends Cubit<AppStates> {
//   AppCubit() : super(AppInitialState());
//   static AppCubit get(context) => BlocProvider.of(context);
//   int currentIndex = 0;
//   List<BottomNavigationBarItem> bottomItems = [
//     const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//     const BottomNavigationBarItem(
//       icon: ImageIcon(
//         AssetImage(
//           "assets/images/predict1.png",
//         ),
//       ),
//       label: "Predict",
//     ),
//     const BottomNavigationBarItem(
//         icon: ImageIcon(
//           AssetImage("assets/images/advice1.png"),
//         ),
//         label: "Advices"),
//     const BottomNavigationBarItem(
//         icon: ImageIcon(
//           AssetImage("assets/images/games.png"),
//         ),
//         label: "Activity"),
//   ];

//   final List screens = [
//     const Home(),
//     const Predict(),
//     const Advices(),
//     const Activity()
//   ];
//  SigninModel signinModel;
//  List<dynamic> AdvicesList = [];

  

  

  final List screens = [
    const Home(),
    const Predict(),
    const Advices(),
    const Activity()
  ];
  List<dynamic> AdvicesList = [];

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

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 2) {
      getAdvices();
    }
    emit(AppBottomNavState());
  }
}
