

import 'package:flutter/material.dart';

import 'package:rive/rive.dart';


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
                                "You have completed this Level",
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
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Row(
                          //       children: const [
                          //         Icon(
                          //           Icons.abc
                          //         ),
                          //         Text(
                          //           "time",
                          //           style: TextStyle(
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     Row(
                          //       children: const [
                          //         Icon(
                          //           Icons.multiple_stop_rounded,
                          //         ),
                          //         Text(
                          //           "score",
                          //           style: TextStyle(
                          //             fontSize: 20,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
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
                        onPressed: ()=>nav1,
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
                        onPressed: ()=>nav2,
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
