
import 'package:autismx/screens/activities/learn_time/MinuteTwo.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/local/component.dart';
class MinuteOne extends StatefulWidget {
  const MinuteOne({ Key key }) : super(key: key);

  @override
  State<MinuteOne> createState() => _MinuteOneState();
}

class _MinuteOneState extends State<MinuteOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(

        children: [
           CustombackAppBar(context, (){Navigator.pop(context);}),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/5 min.gif',
                ),
              ),
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'The Distance Between any',
              style: TextStyle(
                  fontSize: 22,
                  color: ColorManager.greyFont,
                  ),
              children: [
                 TextSpan(
                  text: ' 2 ',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                 TextSpan(
                  text: 'Number',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'is ',
              style: TextStyle(
                  fontSize: 22,
                  color: ColorManager.greyFont,
                  ),
              children: [
                TextSpan(
                  text: '5 Minute .',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 150,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(35),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) {
                    return MinuteTwo();
                  }),
                );
              },
              child: const Text(
                'Next',
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}