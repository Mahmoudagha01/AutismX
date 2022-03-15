import 'package:flutter/material.dart';


import 'screens/onboarding/on_boarding_page.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autism project',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home:   OnBoardingPage(),
    );
  }
}


