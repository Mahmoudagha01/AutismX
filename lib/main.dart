import 'package:autismx/screens/activities/puzzle/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/onboarding/on_boarding_page.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autism project',
      debugShowCheckedModeBanner: false,
localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home:   OnBoardingPage(),
    );
  }
}


