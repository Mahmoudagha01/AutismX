import 'package:autismx/screens/activities/learn_basic/animaltest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';



import '../../../shared/local/component.dart';
import 'ColorScreen.dart';
import 'SchoolScreen.dart';

class AnimalScreen extends StatefulWidget {
  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

enum ttsstate { playing, stopped }

class _AnimalScreenState extends State<AnimalScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Cat',
      'image': 'assets/image/cat.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Cat',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Cat',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Cat Make ?',
      'image4': 'assets/image/get cat.png',
      'text4': 'Can We get a Cat as Pet ?',
    },
    {
      'text': 'Dog',
      'image': 'assets/image/dog.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Dog',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Dog',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Dog Make ?',
      'image4': 'assets/image/get dog.png',
      'text4': 'Can We get a Dog as Pet ?',
    },
    {
      'text': 'Fish',
      'image': 'assets/image/fish.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Fish',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Fish',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Fish Make ?',
      'image4': 'assets/image/get fish.png',
      'text4': 'Can We get a Fish as Pet ?',
    },
    {
      'text': 'Butterfly',
      'image': 'assets/image/butterfly.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Butterflies',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Butterfly',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Butterfly Make ?',
      'image4': 'assets/image/get butterfly.png',
      'text4': 'Can We get a Butterfly as Pet ?',
    },
    {
      'text': 'Rabbit',
      'image': 'assets/image/rabbit.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Rabbit',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Rabbit',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Rabbit Make ?',
      'image4': 'assets/image/get rabbit.png',
      'text4': 'Can We get a Rabbit as Pet ?',
    },
    {
      'text': 'Kangaroo',
      'image': 'assets/image/kangaroo.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Kangaroo',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Kangaroo',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Kangaroo Make ?',
      'image4': 'assets/image/kangaroo.png',
      'text4': 'Can I See The Kangaroo ?',
    },
    {
      'text': 'Frog',
      'image': 'assets/image/frog.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Frog',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Frog',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Frog Make ?',
      'image4': 'assets/image/get frog.png',
      'text4': 'Can We get a Frog as Pet ?',
    },
    {
      'text': 'Giraffe',
      'image': 'assets/image/giraffe.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Giraffe',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Giraffe',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Giraffe Make ?',
      'image4': 'assets/image/giraffe.png',
      'text4': 'Can I See The Giraffe ?'
    },
    {
      'text': 'Turtle',
      'image': 'assets/image/get turtle.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Turtle',
      'image2': 'assets/image/i saw.png',
      'text2': 'I Saw a Turtle',
      'image3': 'assets/image/noise.png',
      'text3': 'What Noise Dose a Turtle Make ?',
      'image4': 'assets/image/turtle.png',
      'text4': 'Can We get a Rabbit as Pet ?',
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
                    'Animals',
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
                                fontSize: 21,
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
                                fontSize: 21,
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
                                fontSize: 21,
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
                                fontSize: 21,
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
        color: Colors.orangeAccent.shade100,
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Animals',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _Speak('Animals');
                                });
                              },
                              icon: const Icon(Icons.volume_up)),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AnimalTest()));
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
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                              color: Colors.orangeAccent.shade100),
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
                                  child: Text(
                                    '${_listinfo[index]['text']}',
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.black),
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
                          return SchoolScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: 40,
                                height: 30,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/image/school.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 7.0),
                              child: Text(
                                'School',
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
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Colors',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Container(
                                width: 55,
                                height: 27,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/image/colors.png',
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
