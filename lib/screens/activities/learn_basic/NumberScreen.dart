import 'package:autismx/screens/activities/learn_basic/numberstest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


import '../../../shared/local/component.dart';
import 'ActivityScreen.dart';
import 'Activitytest.dart';
import 'ShapeScreen.dart';


class NumberScreen extends StatefulWidget {
  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

enum ttsstate { playing, stopped }

class _NumberScreenState extends State<NumberScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'One',
      'image': 'assets/image/one.png',
      'image1': 'assets/image/before.png',
      'text1': 'One Comes Before Two',
      'image2': 'assets/image/after.png',
      'text2': 'One Comes After Zero',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want One',
    },
    {
      'text': 'Two',
      'image': 'assets/image/two.png',
      'image1': 'assets/image/before.png',
      'text1': 'Two Comes Before Three',
      'image2': 'assets/image/after.png',
      'text2': 'Two Comes After One',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Two',
    },
    {
      'text': 'Three',
      'image': 'assets/image/three.png',
      'image1': 'assets/image/before.png',
      'text1': 'Three Comes Before Four',
      'image2': 'assets/image/after.png',
      'text2': 'Three Comes After Two',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Three',
    },
    {
      'text': 'Four',
      'image': 'assets/image/four.png',
      'image1': 'assets/image/before.png',
      'text1': 'Four Comes Before Five',
      'image2': 'assets/image/after.png',
      'text2': 'Four Comes After Three',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Four',
    },
    {
      'text': 'Five',
      'image': 'assets/image/five.png',
      'image1': 'assets/image/before.png',
      'text1': 'Five Comes Before Six',
      'image2': 'assets/image/after.png',
      'text2': 'Five Comes After Four',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Five',
    },
    {
      'text': 'Six',
      'image': 'assets/image/six.png',
      'image1': 'assets/image/before.png',
      'text1': 'Six Comes Before Seven',
      'image2': 'assets/image/after.png',
      'text2': 'Six Comes After Five',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Six',
    },
    {
      'text': 'Seven',
      'image': 'assets/image/sevn.png',
      'image1': 'assets/image/before.png',
      'text1': 'Seven Comes Before Eight',
      'image2': 'assets/image/after.png',
      'text2': 'Seven Comes After Six',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Seven',
    },
    {
      'text': 'Eight',
      'image': 'assets/image/eight.png',
      'image1': 'assets/image/before.png',
      'text1': 'Eight Comes Before Nine',
      'image2': 'assets/image/after.png',
      'text2': 'Eight Comes After Seven',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Eight',
    },
    {
      'text': 'Nine',
      'image': 'assets/image/nine.png',
      'image1': 'assets/image/before.png',
      'text1': 'Nine Comes Before Ten',
      'image2': 'assets/image/after.png',
      'text2': 'Nine Comes After Eight',
      'image3': 'assets/image/iwant.png',
      'text3': 'I Want Nine',
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
                    'Numbers',
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
        color: Colors.pinkAccent.shade100,
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
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(children: [const Text(
                      'Numbers',
                      style:  TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                            _Speak('Numbers');
                          });
                    }
                    , icon: const Icon(Icons.volume_up)),],),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NumberTest()));
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
                            _Speak(_listinfo[index]['text']);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pinkAccent.shade100,
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
                          return ActivityScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 158,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen.shade400,
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
                                    'assets/image/activites.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left:9),
                              child:  Text(
                                'Activities',
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
                          return ShapeScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 155,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber.shade300,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Shapes',
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
                                      'assets/image/shapes.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            //Image.asset('assets/image/feeling.png',width: 65,height: 30,fit: BoxFit.fill,),
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
