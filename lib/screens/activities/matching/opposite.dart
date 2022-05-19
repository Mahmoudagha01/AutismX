import 'package:audioplayers/audio_cache.dart';
import 'package:autismx/screens/activities/matching/home.dart';
import 'package:autismx/screens/activities/matching/item_model.dart';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';


class OppositeMatch extends StatefulWidget {
  @override
  _OppositeMatchState createState() => _OppositeMatchState();
}

class _OppositeMatchState extends State<OppositeMatch> {
  var player = AudioCache();
  List<ItemModel> items;

  List reverseItem;
  int score;
  bool gameOver;

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          value: 'Light',
          name: 'Light',
          img: 'assets/match_images/Light.png'),
      ItemModel(
          value: 'Up',
          name: 'Up',
          img: 'assets/match_images/up.png'),
      ItemModel(
          value: 'Clean', name: 'Clean', img: 'assets/match_images/clean.png'),
      // ItemModel(
      //     value: 'orange', name: 'orange', img: 'assets/match_images/orange 1.png'),
      ItemModel(
          value: 'Open',
          name: 'Open',
          img: 'assets/match_images/open.png'),
           ItemModel(
          value: 'Cold',
          name: 'Cold',
          img: 'assets/match_images/freeze.png'),
           ItemModel(
          value: 'Fast',
          name: 'Fast',
          img: 'assets/match_images/Fast.png'),
           ItemModel(
          value: 'Big',
          name: 'Big',
          img: 'assets/match_images/big.png'),
      // ItemModel(
      //     value: 'straw', name: 'straw', img: 'assets/match_images/straw 1.png'),
      // ItemModel(
      //     value: 'lim',
      //     name: 'lim',
      //     img: 'assets/match_images/limo 1.png'),
      // ItemModel(
      //     value: 'gua',
      //     name: 'gua',
      //     img: 'assets/match_images/guava 1.png'),
    ];
    reverseItem = [
      ItemModel(
          value: 'Light',
          name: 'Heavy',
          img: 'assets/match_images/heavy.png'),
      ItemModel(
          value: 'Up',
          name: 'Down',
          img: 'assets/match_images/down.png'),
      ItemModel(
          value: 'Clean', name: 'Dirty', img: 'assets/match_images/dirty.png'),
      // ItemModel(
      //     value: 'orange', name: 'orange', img: 'assets/match_images/orange 2.png'),
     ItemModel(
          value: 'Open',
          name: 'Close',
          img: 'assets/match_images/close.png'),
           ItemModel(
          value: 'Cold',
          name: 'Hot',
          img: 'assets/match_images/hot.png'),
           ItemModel(
          value: 'Fast',
          name: 'Slow',
          img: 'assets/match_images/slow.png'),
           ItemModel(
          value: 'Big',
          name: 'Small',
          img: 'assets/match_images/small.png'),
      // ItemModel(
      //     value: 'straw', name: 'straw', img: 'assets/match_images/straw 2.png'),
      // ItemModel(
      //     value: 'lim',
      //     name: 'lim',
      //     img: 'assets/match_images/limo 2.png'),
      // ItemModel(
      //     value: 'gua',
      //     name: 'gua',
      //     img: 'assets/match_images/guava 2.png'),
    ];
    

    items.shuffle();
    
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) gameOver = true;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              gameOver
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Score: ',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            TextSpan(
                              text: '$score',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
              if (!gameOver)
                Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: items.map((item) {
                        return Container(
                            margin: const EdgeInsets.all(8),
                            child: Draggable<ItemModel>(
                              data: item,
                              childWhenDragging: Container(
                                width: 60,
                                height: 50,
                                child: Image.asset(item.img),
                              ),
                              feedback: Container(
                                width: 80,
                                height: 80,
                                child: Image.asset(item.img),
                              ),
                              child: Container(
                                width: 100,
                               
                                height: 80,
                                child:
                                    Column(
                                      children: [
                                        Image.asset(item.img, fit: BoxFit.contain,width: 100,height: 60,),
                                        Expanded(child: Text(item.name))
                                      ],
                                    ),
                              ),
                            ));
                      }).toList(),
                    ),
                    const Spacer(flex: 2),
                    Column(
                      children: reverseItem.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(receivedItem);
                                reverseItem.remove(item);
                              });
                              score += 10;
                              item.accepting = false;

                              player.play('true.mp3');
                            } else {
                              setState(() {
                                score -= 5;
                                item.accepting = false;
                                player.play('false.mp3');
                              });
                            }
                          },
                          onWillAccept: (receivedItem) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          onLeave: (receivedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          builder: (context, acceptedItems, rejectedItems) =>
                              Container(
                            margin: const EdgeInsets.all(8),
                            width: 80,
                            height: 80,
                            child:Column(
                                      children: [
                                        Image.asset(item.img, fit: BoxFit.contain,width: 100,height: 60,),
                                        Expanded(child: Text(item.name))
                                      ],
                                    ),
                          ),
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                  ],
                ),
              if (gameOver)
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: const Center(
                          child: RiveAnimation.asset(
                            'assets/rive/winner.riv',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Game Over',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          result(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Your Score Is: ',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              TextSpan(
                                text: '$score',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (gameOver)
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              initGame();
                            });
                          },
                          child: const Text(
                            'Replay',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MatchHome()));
                          },
                          child: const Text(
                            'Start New Game',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }

  //Functions:

  String result() {
    if (score == 70) {
      player.play('success.wav');
      return 'Awesome!';
    } else {
      player.play('tryAgain.wav');
      return 'Play again to get better score';
    }
  }
}
