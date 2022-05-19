import 'package:autismx/screens/activities/learn_basic/Activitytest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


import '../../../shared/local/component.dart';
import 'FeelingScreen.dart';
import 'NumberScreen.dart';



class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

enum ttsstate { playing, stopped }

class _ActivityScreenState extends State<ActivityScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Talking',
      'image': 'assets/image/talking.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Talking',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Talking',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Talk With Me ?',
    },
    {
      'text': 'Running',
      'image': 'assets/image/running.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Running',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Running',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Go Running ?',
    },
    {
      'text': 'Walking',
      'image': 'assets/image/walking.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Walking',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Walking',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Walk Together ?',
    },
    {
      'text': 'Basketball',
      'image': 'assets/image/basketball.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Basketball',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Basketball',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Play Basketball ?',
    },
    {
      'text': 'Foottball',
      'image': 'assets/image/football.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Foottball',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Foottball',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to play Foottball ?',
    },
    {
      'text': 'Reading',
      'image': 'assets/image/reading.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Reading',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Reading',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Read Together ?',
    },
    {
      'text': 'Drawing',
      'image': 'assets/image/drawing.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Drawing',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Drawing',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Draw Together ?',
    },
    {
      'text': 'Paintint',
      'image': 'assets/image/painting.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Paintint',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Paintint',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Paint Together ?',
    },
    {
      'text': 'Swimming',
      'image': 'assets/image/swimming.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Swimming',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Like Swimming',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Want to Go to Swimming ?',
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
          return Container(
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
                    'Activities',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.lightGreen.shade300,
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
                      Row(children: [const Text(
                        'Activities',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _Speak('Activities');
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
                                          const ActivityTest()));
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
                  borderRadius:  BorderRadius.only(
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
                            color: Colors.lightGreen.shade300,
                          ),
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
                          return FeelingScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 159,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.cyanAccent.shade200,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            Container(
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
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child:  Text(
                                'Feelings',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
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
                          return NumberScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 163,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent.shade100,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Row(
                          children: [
                            const Text(
                              'Numbers',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                width: 55,
                                height: 27,
                                decoration: const BoxDecoration(
                                  image:  DecorationImage(
                                    image: AssetImage(
                                      'assets/image/numbers2.png',
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
