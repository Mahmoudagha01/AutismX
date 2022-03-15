import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';


class Activity extends StatefulWidget {
  const Activity({ Key key }) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
    GlobalKey<ScaffoldState> Scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: Scaffoldkey,
      body: SafeArea(
        child: Column(
          children: [
             CustomAppBar(context:context,scaffoldkey:Scaffoldkey),
          ],
        ),
      ),
      endDrawer: myDrawer(context, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        },() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CenterLayout(),
            ),
          );
        }, () {}, () {}, () {}, () {}),
    );
  }
}