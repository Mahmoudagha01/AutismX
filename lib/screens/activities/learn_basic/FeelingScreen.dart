import 'package:autismx/screens/activities/learn_basic/feelingtest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


import '../../../shared/local/component.dart';
import 'ActivityScreen.dart';
import 'FoodScreen.dart';



class FeelingScreen extends StatefulWidget {
  @override
  State<FeelingScreen> createState() => _FeelingScreenState();
}
enum ttsstate { playing, stopped }

class _FeelingScreenState extends State<FeelingScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Happy',
      'image': 'assets/image/happy.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Happy',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Happy',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Happy ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Want to Feel Happy',
    },
    {
      'text': 'Sad',
      'image': 'assets/image/sad.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Sad',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Sad',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Sad ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Don\'t Want to Feel Sad',
    },
    {
      'text': 'Exhausted',
      'image': 'assets/image/exhausted.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Exhausted',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Exhausted',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Exhausted ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Don\'t Want to Feel Exhausted',
    },
    {
      'text': 'Relaxed',
      'image': 'assets/image/relaxed.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Relaxed',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Relaxed',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Relaxed ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Want to Feel Relaxed',
    },
    {
      'text': 'In Love',
      'image': 'assets/image/in love.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m In Love',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel In Love',
      'image3': 'assets/image/Ques.png',
      'text3': 'Are You In Love ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Want to Fall In Love',
    },
    {
      'text': 'Stressed',
      'image': 'assets/image/stressed.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Stressed',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Stressed',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Stressed ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Don\'t Want to Feel Stressed',
    },
    {
      'text': 'Thankful',
      'image': 'assets/image/thankful.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Thankful',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Thankful',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Thankful?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Want to Feel Thankful',
    },
    {
      'text': 'Confused',
      'image': 'assets/image/confused.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Confused',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Confused',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Confused ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'You Are Confusing Me',
    },
    {
      'text': 'Joyful',
      'image': 'assets/image/joyful.png',
      'image1': 'assets/image/iam.png',
      'text1': 'I\'m Joyful',
      'image2': 'assets/image/feel.png',
      'text2': 'I Feel Joyful',
      'image3': 'assets/image/Ques.png',
      'text3': 'Do You Feel Joyful ?',
      'image4': 'assets/image/iwant to.png',
      'text4': 'I Want to Feel Joyful',
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
                        onTap: (){
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
                    'Feelings',
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
                            height: 40,
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
                            width: 45,
                            height: 40,
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
       color: Colors.cyanAccent.shade100,
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
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [ const Text(
                      'Feelings',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                            _Speak('Feelings');
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
                                          const FeelingTest()));
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
                          });
                          setState(() {
                            _Speak(_listinfo[index]['text']);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.cyanAccent.shade100,),
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
                          return FoodScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color:Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                width: 50,
                                height: 33,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:  AssetImage(
                                      'assets/image/food.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 7),
                              child: Text(
                                'Food',
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
                          return ActivityScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 165,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen.shade400,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Activities',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                width: 55,
                                height: 30,
                                decoration: const BoxDecoration(
                                  image: const DecorationImage(
                                    image: const AssetImage(
                                       'assets/image/activites.png',
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
