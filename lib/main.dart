import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:autismx/screens/activities/AAC/providers/locked/dialog.dart';
import 'package:autismx/screens/activities/AAC/providers/locked/home.dart';
import 'package:autismx/screens/activities/AAC/providers/settings/settings.dart';
import 'package:autismx/screens/activities/AAC/providers/unlocked/unlocked_home_provider.dart';
import 'package:autismx/screens/activities/puzzle/generated/l10n.dart';
import 'package:autismx/screens/common/profile_cubit.dart';
import 'package:autismx/shared/network/bloc_observer.dart';
import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'screens/onboarding/on_boarding_page.dart';
  
void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel()),
        ChangeNotifierProvider<DialogModel>(create: (context) => DialogModel()),
        ChangeNotifierProvider<HomeModel>(create: (context) => HomeModel()),
        ChangeNotifierProvider<UnlockedHomeProvider>(
            create: (context) => UnlockedHomeProvider()),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(create: (context) => AppCubit())
      ],
      child: MaterialApp(
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
        home: OnBoardingPage(),
      ),
    );
  }
}
