import 'package:autismx/screens/activities/learn_basic/foodtest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


import '../../../shared/local/component.dart';
import 'ColorScreen.dart';
import 'FeelingScreen.dart';

class FoodScreen extends StatefulWidget {
  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

enum ttsstate { playing, stopped }

class _FoodScreenState extends State<FoodScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Hungry',
      'image': 'assets/image/hungry.png',
      'image1': 'assets/image/Exc mark.png',
      'text1': 'I\'m Hungry',
      'image2': 'assets/image/Ques.png',
      'text2': 'Are You Hungry ?',
      'image3': 'assets/image/askfor help.png',
      'text3': 'Can You Make Me Food ?',
      'image4': 'assets/image/dinner.png',
      'text4': 'What is For Dinner ?',
    },
    {
      'text': 'Thirsty',
      'image': 'assets/image/thirsty.png',
      'image1': 'assets/image/Exc mark.png',
      'text1': 'I\'m Thirsty',
      'image2': 'assets/image/some water.png',
      'text2': 'Can I Have Some Water ?',
      'image3': 'assets/image/glass milk.png',
      'text3': 'Can I Have a glass Of Water ?',
      'image4': 'assets/image/iwant something.png',
      'text4': 'I Want Something to Drink',
    },
    {
      'text': 'Cutlery',
      'image': 'assets/image/cutlery.png',
      'image1': 'assets/image/cutlery.png',
      'text1': 'I Need Cutlery',
      'image2': 'assets/image/use cutlry.png',
      'text2': 'Help Me Use Cultery',
      'image3': 'assets/image/knife.png',
      'text3': 'I Need a Knife',
      'image4': 'assets/image/spoon.png',
      'text4': 'I Need a Spoon',
    },
    {
      'text': 'Apple',
      'image': 'assets/image/apple.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Apple',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Apple',
      'image3': 'assets/image/i want.png',
      'text3': 'I Want to Eat an Apple',
      'image4': 'assets/image/Ques.png',
      'text4': 'Can You give Me an Apple ?',
    },
    {
      'text': 'Carrot',
      'image': 'assets/image/carrot.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Caarot',
      'image2': 'assets/image/close.png',
      'text2': 'I Don\'t Like Carrot',
      'image3': 'assets/image/i want.png',
      'text3': 'I Want to Eat a Carrot',
      'image4': 'assets/image/Ques.png',
      'text4': 'Can You give Me a Carrot ?',
    },
    {
      'text': 'Beans',
      'image': 'assets/image/beans.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Beans',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Beans',
      'image3': 'assets/image/i want.png',
      'text3': 'I Want to Eat Beans',
      'image4': 'assets/image/Ques.png',
      'text4': 'Can You give Me Beans ?',
    },
    {
      'text': 'Chicken',
      'image': 'assets/image/chicken.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Chicken',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Chicken',
      'image3': 'assets/image/i want.png',
      'text3': 'I Want to Eat Chicken',
      'image4': 'assets/image/i wantfried.png',
      'text4': 'I Want Fried Chicken',
    },
    {
      'text': 'Chocolate',
      'image': 'assets/image/chocolate.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Chocolate',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Chocolate',
      'image3': 'assets/image/i want.png',
      'text3': 'I Want to Eat Chocolate',
      'image4': 'assets/image/dark chocolate.png',
      'text4': 'I Want Dark Chocolate',
    },
    {
      'text': 'Milk',
      'image': 'assets/image/milk.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Milk',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Milk',
      'image3': 'assets/image/i want.png',
      'text3': 'I Want to Drink Milk',
      'image4': 'assets/image/glass milk.png',
      'text4': 'Can I Have a glass Of Milk ?',
    },
  ];
  FlutterTts flutterTts;
  ttsstate TtsState = ttsstate.stopped;
  get isplaying => TtsState == ttsstate.playing;
  get isstopped => TtsState == ttsstate.stopped;

  Future _Speak(String text) async {
    await flutterTts.speak(text);
    List<dynamic> languages = await flutterTts.getLanguages;

    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(0.5);

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(1.0);
  }

  initTts() {
    flutterTts = FlutterTts();
    flutterTts.setStartHandler(() {
      setState(() {
        TtsState = ttsstate.playing;
      });
    });
    flutterTts.setCompletionHandler(() {
      setState(() {
        TtsState = ttsstate.stopped;
      });
    });
    flutterTts.setErrorHandler((message) {
      setState(() {
        TtsState = ttsstate.stopped;
      });
    });
    setSound();
  }

  setSound() async {
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.5);
    
  }

  _Mysheet(int index) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.grey.shade100,
        isScrollControlled: true,
        builder: (ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent.shade100,
                        foregroundColor: Colors.black,
                        child: IconButton(
                          icon: const Icon(
                            Icons.star_border_outlined,
                          ),
                          iconSize: 40,
                          onPressed: () {},
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _Speak(_listinfo[index]['text']);
                          });
                        },
                        child: Container(
                          width: 220,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                            '${_listinfo[index]['image']}',
                          ))),
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent.shade100,
                        foregroundColor: Colors.black,
                        child: IconButton(
                          icon: const Icon(Icons.repeat_outlined),
                          iconSize: 40,
                          onPressed: () {
                            setState(() {
                              _Speak(_listinfo[index]['text']);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 18),
                    child: Text(
                      '${_listinfo[index]['text']}',
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'Food',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, bottom: 30, right: 30),
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            setState(() {
                              _Speak(_listinfo[index]['text1']);
                            });
                          },
                          leading: Image.asset(
                            _listinfo[index]['image1'],
                            width: 40,
                            height: 45,
                          ),
                          title: Text(
                            '${_listinfo[index]['text1']}',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _Speak(_listinfo[index]['text2']);
                            });
                          },
                          leading: Image.asset(
                            _listinfo[index]['image2'],
                            width: 35,
                            height: 35,
                          ),
                          title: Text(
                            '${_listinfo[index]['text2']}',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _Speak(_listinfo[index]['text3']);
                            });
                          },
                          leading: Image.asset(
                            _listinfo[index]['image3'],
                            width: 40,
                            height: 40,
                          ),
                          title: Text(
                            '${_listinfo[index]['text3']}',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            setState(() {
                              _Speak(_listinfo[index]['text4']);
                            });
                          },
                          leading: Image.asset(
                            _listinfo[index]['image4'],
                            width: 40,
                            height: 40,
                          ),
                          title: Text(
                            '${_listinfo[index]['text4']}',
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.redAccent.shade100,
                    foregroundColor: Colors.black,
                    child: IconButton(
                      icon: const Icon(Icons.close_sharp),
                      iconSize: 35,
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.greenAccent.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustombackAppBar(context, () {
                Navigator.pop(context);
              },),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(children: [  const Text(
                        'Food',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _Speak('Food');
                            });
                          },
                          icon: const Icon(Icons.volume_up)),],),
                          Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FoodTest()));
                            },
                            child: Text(
                              "Take a Test",
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                           Icon(Icons.arrow_forward_ios,color: Colors.black.withOpacity(0.7),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                //height: MediaQuery.of(context).size.height*0.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(30),
                      topRight:  Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.5,
                        crossAxisCount: 3,
                        mainAxisExtent: 120,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _Mysheet(index);
                          });
                          setState(() {
                            _Speak(_listinfo[index]['text']);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.greenAccent.shade100),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset(
                                  '${_listinfo[index]['image']}',
                                  height: 75,
                                  width: 75,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      '${_listinfo[index]['text']}',
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (ctx) {
                          return ColorScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.limeAccent,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            Container(
                              width: 40,
                              height: 30,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/image/colors.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 12),
                              child:  Text(
                                'Colors',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (ctx) {
                          return FeelingScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 155,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.cyanAccent.shade200,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Feelings',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Container(
                                width: 55,
                                height: 27,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/image/feeling.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
