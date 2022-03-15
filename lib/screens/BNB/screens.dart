import 'package:autismx/screens/BNB/activity.dart';
import 'package:autismx/screens/BNB/advice/advice_view.dart';
import 'package:autismx/screens/BNB/home/home_view.dart';
import 'package:autismx/screens/BNB/predict.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:flutter/material.dart';




class Screens extends StatefulWidget {
  const Screens({ Key key }) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int crrentindex =0;
  List _screens=[Home(),Predict(),Advices(),Activity()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[crrentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: crrentindex,
        selectedItemColor: ColorManager.blue,
        unselectedItemColor: ColorManager.greyFont,
        onTap: (index){
          setState(() {
            crrentindex=index;
          });
        },
        items:const [
       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
       BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/predict1.png",),),label:"Predict",),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/advice1.png"),), label: "Advices"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/games.png"),), label: "Activity"),
        ],),
    );
  }
}