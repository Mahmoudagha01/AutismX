import 'dart:math';

import 'package:autismx/screens/BNB/activity/imagination.dart';
import 'package:autismx/screens/activities/maze/src/level10.dart';
import 'package:autismx/screens/activities/maze/src/maze_painter.dart';
import 'package:autismx/screens/activities/maze/src/models/item.dart';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../../shared/local/component.dart';
import 'maze_widget.dart';

class MazeLevel9 extends StatefulWidget {
  @override
  _MazeLevel9State createState() => _MazeLevel9State();
}

ConfettiController _controllerCenterRight;

class _MazeLevel9State extends State<MazeLevel9> {
    
  @override
  void initState() {
    super.initState();

    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
   

    super.dispose();
  }
Path drawStar(Size size) {
    
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CustombackAppBar(context, (){Navigator.pushReplacement(context,  MaterialPageRoute(
                builder: (context) => Imagination(),
              ),);}),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ConfettiWidget(
                    confettiController: _controllerCenterRight,
                    blastDirection: pi,
                    particleDrag: 0.05, 
                    emissionFrequency: 0.05,
                    numberOfParticles: 20, 
                    gravity: 0.05, 
                    shouldLoop: false,
                    colors: const [
                      Colors.green,
                      Colors.blue,
                      Colors.pink,
                      Colors.yellow
                    ],
                  ),
                ),
                Maze(
                  player: MazeItem('assets/images/rabbit.png', ImageType.asset),
                  checkpoints: [
                    MazeItem('assets/images/dollar.png', ImageType.asset),
                    MazeItem('assets/images/dollar.png', ImageType.asset),
                    MazeItem('assets/images/dollar.png', ImageType.asset),
                    MazeItem('assets/images/dollar.png', ImageType.asset),
                    MazeItem('assets/images/dollar.png', ImageType.asset),
                  ],
                  columns: 8,
                  rows: 14,
                  wallThickness: 4.0,
                  wallColor: Theme.of(context).primaryColor,
                  finish: MazeItem('assets/images/carrots.png', ImageType.asset),
                  celebrate: () =>_controllerCenterRight.play(),
                  onFinish: () =>
                      showWinnerDialog(context,),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
showWinnerDialog(
  BuildContext context,{Function nav1,Function nav2,
  @required int moves,
  @required int time,
}) {
  return showDialog(
    context: context,
    
    builder: (_) => WinnerDialog(
      moves: moves,
      time: time,
    ),
  );
}
class WinnerDialog extends StatelessWidget {
  final int moves;
  final int time;
  final Function nav1;
  final Function nav2;
  const WinnerDialog({
    Key key,
    this.nav1,
    this.nav2,
    @required this.moves,
    @required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  
    return Center(

        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Stack(
                    children: [
                      const Center(
                        child: RiveAnimation.asset(
                          'assets/rive/winner.riv',
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                               "GREAT JOP",
                                style: TextStyle(color: Colors.blue,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                "You have completed Level 9",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child:Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children:  [
                                  const Icon(
                                    Icons.monetization_on_outlined
                                  ),
                                  Text(
                                    " Score : ${MazePainter.getScore()}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                          
                             ),
                             ],
                           ),
                     ),
                     //,
                       ) ],
                  ),
                ),
               // const SizedBox(height: 15),
                Container(
                  height: 0.6,
                  color:  Colors.black12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => MazeLevel9(),
                ),
                (route) => false,
              );
                        },
                        child: const Text(
                          "Play Again",
                          style: TextStyle(
                            fontSize: 20,
                            color:Colors.red
                          ),
                        ),
                      ),
                      const Text("|",style: TextStyle(color: Colors.grey,
                            fontSize: 25,
                          ),),
                      TextButton(
                        onPressed: (){
                          Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MazeLevel10(),
                ),
              );
                        },
                        child: const Text(
                          "Next Level",
                          style: TextStyle(color: Colors.green,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}