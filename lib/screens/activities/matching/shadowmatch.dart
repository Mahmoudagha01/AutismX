
import 'package:audioplayers/audio_cache.dart';
import 'package:autismx/screens/activities/matching/home.dart';
import 'package:autismx/screens/activities/matching/item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';



class ShadowMatch extends StatefulWidget {
  @override
  _ShadowMatchState createState() => _ShadowMatchState();
}

class _ShadowMatchState extends State<ShadowMatch> {
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
          value: 'lion',
          name: 'lion',
          img: 'assets/match_images/3.1.png'),
      ItemModel(
          value: 'peng',
          name: 'peng',
          img: 'assets/match_images/2.1.png'),
      ItemModel(
          value: 'fox', name: 'fox', img: 'assets/match_images/1.1.png'),
      // ItemModel(
      //     value: 'orange', name: 'orange', img: 'assets/match_images/orange 1.png'),
      ItemModel(
          value: 'goat',
          name: 'goat',
          img: 'assets/match_images/4.1.png'),
           ItemModel(
          value: 'jed',
          name: 'jed',
          img: 'assets/match_images/bondok.png'),
           ItemModel(
          value: 'cow',
          name: 'cow',
          img: 'assets/match_images/sen.png'),
           ItemModel(
          value: 'dog',
          name: 'dog',
          img: 'assets/match_images/skate.png'),
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
          value: 'lion',
          name: 'lion',
          img: 'assets/match_images/3.2.png'),
      ItemModel(
          value: 'peng',
          name: 'peng',
          img: 'assets/match_images/2.2.png'),
      ItemModel(
          value: 'fox', name: 'fox', img: 'assets/match_images/1.2.png'),
      // ItemModel(
      //     value: 'orange', name: 'orange', img: 'assets/match_images/orange 2.png'),
     ItemModel(
          value: 'goat',
          name: 'goat',
          img: 'assets/match_images/4.2.png'),
           ItemModel(
          value: 'jed',
          name: 'jed',
          img: 'assets/match_images/bondok2.png'),
           ItemModel(
          value: 'cow',
          name: 'cow',
          img: 'assets/match_images/sen2.png'),
           ItemModel(
          value: 'dog',
          name: 'dog',
          img: 'assets/match_images/skate2.png'),
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
                                width: 80,
                                height: 80,
                                child:
                                    Image.asset(item.img, fit: BoxFit.contain),
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
                            child: Image.asset(item.img),
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
