import 'package:autismx/screens/activities/learn_time/ExactHour.dart';
import 'package:flutter/material.dart';
import '../../../shared/colors.dart';
import '../../../shared/local/component.dart';

class StartClock extends StatefulWidget {
  const StartClock({Key key}) : super(key: key);

  @override
  State<StartClock> createState() => _StartClockState();
}

class _StartClockState extends State<StartClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
   
      body: Column(
        
        children: [
CustombackAppBar(context, (){Navigator.pop(context);}),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/start.gif',
                ),
              ),
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'The Clock is Divided into ',
              style: TextStyle(
                  fontSize: 20,
                  color: ColorManager.greyFont,
                  ),
              children: [
                TextSpan(
                  text: '4 Quarters',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Each Of Them is ',
              style: TextStyle(
                  fontSize: 20,
                  color: ColorManager.greyFont
                  ),
              children: [
                TextSpan(
                  text: '15 Minutes .',
                  style: TextStyle(
                      fontSize: 20,
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
                    return const ExactHour();
                  }),
                );
              },
              child: const Text(
                'Start',
                style: TextStyle(
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
