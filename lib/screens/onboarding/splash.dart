import 'dart:async';

import 'package:autismx/screens/parent/sing_in/signin_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 2550), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignInParentLayout())),);

    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 252, 255, 1),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height*0.7,
          child: Image.asset("assets/images/logo.gif")),
      ),
    );
  }
}
