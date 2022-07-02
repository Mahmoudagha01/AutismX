import 'package:audioplayers/audio_cache.dart';
import 'package:autismx/screens/activities/matching/home.dart';
import 'package:autismx/screens/activities/matching/item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ColorMatch extends StatefulWidget {
  @override
  _ColorMatchState createState() => _ColorMatchState();
}

class _ColorMatchState extends State<ColorMatch> {
  var player = AudioCache();
  List<ItemModel> items;
  List<ItemModel> items2;
  int score;
  bool gameOver;

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          value: 'Orange',
          name: 'Orange',
          img: 'assets/match_images/bag 3.png'),
      ItemModel(
          value: 'Green', name: 'Green', img: 'assets/match_images/bag 2.png'),
      ItemModel(
          value: 'Blue', name: 'Blue', img: 'assets/match_images/bag 4.png'),
      ItemModel(
          value: 'Grey', name: 'Grey', img: 'assets/match_images/bag 1.png'),
      ItemModel(
          value: 'Yellow',
          name: 'Yellow',
          img: 'assets/match_images/book 3.png'),
      ItemModel(
          value: 'Red', name: 'Red', img: 'assets/match_images/book 2.png'),
      ItemModel(
          value: 'Purple',
          name: 'Purple',
          img: 'assets/match_images/pen 4.png'),
    ];
    items2 = List<ItemModel>.from(items);

    items.shuffle();
    items2.shuffle();
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
                              childWhenDragging: SizedBox(
                                width: 60,
                                height: 50,
                                child: Image.asset(item.img),
                              ),
                              feedback: SizedBox(
                                width: 70,
                                height: 60,
                                child: Image.asset(item.img),
                              ),
                              child: SizedBox(
                                width: 90,
                                height: 80,
                                child: Image.asset(item.img),
                              ),
                            ));
                      }).toList(),
                    ),
                    const Spacer(flex: 2),
                    Column(
                      children: items2.map((item) {
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem) {
                            if (item.value == receivedItem.value) {
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: item.accepting
                                        ? Colors.grey[400]
                                        : Colors.grey[200],
                                  ),
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.width / 6.5,
                                  width: MediaQuery.of(context).size.width / 3,
                                  margin: const EdgeInsets.all(8),
                                  child: Text(
                                    item.name,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )),
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
