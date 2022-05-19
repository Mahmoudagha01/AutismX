import 'package:autismx/screens/activities/learn_basic/convtest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../shared/local/component.dart';
import 'PeopleScreen.dart';
import 'SchoolScreen.dart';

class ConversationScreen extends StatefulWidget {
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}
enum ttsstate { playing, stopped }
class _ConversationScreenState extends State<ConversationScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Me',
      'image': 'assets/image/me.png',
      'image1': 'assets/image/iwant to.png',
      'text1': 'My Name Is Mickey ',
      'image2': 'assets/image/i am.png',
      'text2': 'I\'m Mickey',
      'image3': 'assets/image/do you.png',
      'text3': 'Do You Know My Name ?',
      'image4': 'assets/image/Ques.png',
      'text4': 'What Is Your Name ?',
    },
    {
      'text': 'Hello',
      'image': 'assets/image/hello.png',
      'image1': 'assets/image/hi.png',
      'text1': 'Hello ',
      'image2': 'assets/image/hi.png',
      'text2': 'Hi',
      'image3': 'assets/image/hi.png',
      'text3': 'Greetings',
      'image4': 'assets/image/Ques.png',
      'text4': 'How Are You ?',
    },
    {
      'text': 'Help',
      'image': 'assets/image/help.png',
      'image1': 'assets/image/help me.png',
      'text1': 'Help Me ',
      'image2': 'assets/image/Ques.png',
      'text2': 'Can You Help Me',
      'image3': 'assets/image/need help.png',
      'text3': 'I Need Help',
      'image4': 'assets/image/need help2.png',
      'text4': 'Do You Need Help ?',
    },
    {
      'text': 'Yes',
      'image': 'assets/image/yes.png',
      'image1': 'assets/image/yes2.png',
      'text1': 'Yes ',
      'image2': 'assets/image/yes please.png',
      'text2': 'Yes Please',
      'image3': 'assets/image/alright.png',
      'text3': 'Alright',
      'image4': 'assets/image/agreed.png',
      'text4': 'Agreed',
    },
    {
      'text': 'No',
      'image': 'assets/image/no.png',
      'image1': 'assets/image/no2.png',
      'text1': 'No ',
      'image2': 'assets/image/nope.png',
      'text2': 'Nope',
      'image3': 'assets/image/never.png',
      'text3': 'Never',
      'image4': 'assets/image/Ques.png',
      'text4': 'You Don\'t Like It ?',
    },
    {
      'text': 'Toilet',
      'image': 'assets/image/toilet.png',
      'image1': 'assets/image/go toilet.png',
      'text1': 'I Need to GO to The Toilet ',
      'image2': 'assets/image/poop.png',
      'text2': 'I Need to Poop',
      'image3': 'assets/image/peed myself.png',
      'text3': 'I Peed Myself',
      'image4': 'assets/image/myself.png',
      'text4': 'I Pooped Myself',
    },
    {
      'text': 'What',
      'image': 'assets/image/what.png',
      'image1': 'assets/image/Ques.png',
      'text1': 'What IS That ? ',
      'image2': 'assets/image/mean.png',
      'text2': 'What Do You Mean ?',
      'image3': 'assets/image/explain it.png',
      'text3': 'Can You Explain It ?',
      'image4': 'assets/image/repeat.png',
      'text4': 'Can You Repeat What You Said ?',
    },
    {
      'text': 'Sleep',
      'image': 'assets/image/sleep.png',
      'image1': 'assets/image/want sleep.png',
      'text1': 'I Want to Sleep',
      'image2': 'assets/image/i dontlike.png',
      'text2': 'I Don\'t Want to Sleep',
      'image3': 'assets/image/im tired.png',
      'text3': 'I\'m Tired',
      'image4': 'assets/image/Ques.png',
      'text4': 'Are You Tired ?',
    },
    {
      'text': 'Bath',
      'image': 'assets/image/bath.png',
      'image1': 'assets/image/bath2.png',
      'text1': 'I Want to Take a Bath',
      'image2': 'assets/image/heart.png',
      'text2': 'I Like Taking a Bath',
      'image3': 'assets/image/shower.png',
      'text3': 'I Want to Take a Shower',
      'image4': 'assets/image/wash.png',
      'text4': 'I Want to Wash My Hands',
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
                    'Conversations',
                    style: const TextStyle(
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
        color: const Color.fromRGBO(248, 187, 208, 1),
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
                      'Conversations',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                            _Speak('Conversations');
                          });
                    }
                    , icon: const Icon(Icons.volume_up)),],),
                     Row(children: [TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ConvTest()));
                    }, child:  Text("Take a Test",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),)), Icon(Icons.arrow_forward_ios,color: Colors.black.withOpacity(0.7),)],)
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
                          });
                          setState(() {
                            _Speak(_listinfo[index]['text']);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:const Color.fromRGBO(248, 187, 208, 1),
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
                          return PeopleScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color:Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                width: 40,
                                height: 30,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:  AssetImage(
                                      'assets/image/people.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            //Image.asset('assets/image/favorite.png',width: 45,height: 33,fit: BoxFit.fill,),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child:  Text(
                                'People',
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
                          return SchoolScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 152,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Row(
                          children: [
                            const Text(
                              'School',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                width: 55,
                                height: 27,
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
