
import 'package:autismx/screens/onboarding/splash.dart';

import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child:
        Scaffold(
          body:
           IntroductionScreen(
            pages: [
              PageViewModel(
                title: 'Answer the survey easily',
                body:
                    'You can diagnose by answering the survey and the result will appear immediately.',
                image: buildImage('assets/images/survey.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Upload child image easily',
                body:
                    'You can diagnose by uploading child image and the result will appear immediately',
                image: buildImage('assets/images/Upload1.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Choose the suitable activity',
                body:
                    'We will tell you child shortcomings in which category and recommend any activity to choose',
                image: buildImage('assets/images/gaming.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Your child will learn a lot',
                body:
                    'We will learn your child a lot of daily activites like reading clock ',
                image: buildImage('assets/images/Clock.png'),
                decoration: getPageDecoration(),
              ),
              PageViewModel(
                title: 'Take a lot of advice',
                body:
                    'You will learn more about Autism and how to deal with autistic child',
                footer: ButtonWidget(
                  text: 'Get Started',
                  onClicked: () => goToHome(context),
                ),
                image: buildImage('assets/images/communication.png'),
                decoration: getPageDecoration(),
              ),
            ],
            
         done: const SizedBox(),
            onDone: () => goToHome(context),
            showNextButton: true,

            showSkipButton: true,
            skip: const Text('Skip',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorManager.greyFont),),
            onSkip: () => goToHome(context),
            next: const Text('Next',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: ColorManager.blueFont),),
            dotsDecorator: getDotDecoration(),
            onChange: (index) => print('Page $index selected'),
            globalBackgroundColor: Colors.white,
           
            nextFlex: 0,
            // isProgressTap: false,
            // isProgress: false,
            // showNextButton: false,
            // freeze: true,
            // animationDuration: 1000,
          ),
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => SplashScreen()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: const Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color:  Color.fromARGB(255, 39, 143, 221),
        ),
        bodyTextStyle:
            const TextStyle(fontSize: 20, color:  Color.fromARGB(255, 122, 122, 122)),
       // descriptionPadding: const EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: const EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
