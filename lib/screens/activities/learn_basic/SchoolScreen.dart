import 'package:autismx/screens/activities/learn_basic/schooltest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';



import '../../../shared/local/component.dart';
import 'AnimalScreen.dart';
import 'ConversationScreen.dart';


class SchoolScreen extends StatefulWidget {
  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

enum ttsstate { playing, stopped }

class _SchoolScreenState extends State<SchoolScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Book',
      'image': 'assets/image/book.png',
      'image1': 'assets/image/textbook.png',
      'text1': 'TextBook',
      'image2': 'assets/image/workbook.png',
      'text2': 'WorkBook',
      'image3': 'assets/image/reading book.png',
      'text3': 'Reading a Book',
      'image4': 'assets/image/borrow.png',
      'text4': 'Can I Borrow Your Book ?',
    },
    {
      'text': 'Chair',
      'image': 'assets/image/chair.png',
      'image1': 'assets/image/can set.png',
      'text1': 'Can I Set With You ?',
      'image2': 'assets/image/Ques.png',
      'text2': 'Which Chair Is Mine ?',
      'image3': 'assets/image/spilled.png',
      'text3': 'I Spilled On My Chair',
      'image4': 'assets/image/isthis.png',
      'text4': 'Is This Chair Taken ?',
    },
    {
      'text': 'Desk',
      'image': 'assets/image/desk.png',
      'image1': 'assets/image/can set.png',
      'text1': 'Can I Use This Desk ?',
      'image2': 'assets/image/Ques.png',
      'text2': 'Which Desk Is Mine ?',
      'image3': 'assets/image/spilled.png',
      'text3': 'I Spilled On My Desk',
      'image4': 'assets/image/i dontlike.png',
      'text4': 'Don\'t Scratch Your Desk',
    },
    {
      'text': 'Blackboard',
      'image': 'assets/image/blackboard.png',
      'image1': 'assets/image/i saw.png',
      'text1': 'Look at The Blackboard',
      'image2': 'assets/image/cleaning.png',
      'text2': 'Cleaning The Blackboard',
      'image3': 'assets/image/chalk.png',
      'text3': 'Give Me a Chalk',
      'image4': 'assets/image/taking notes.png',
      'text4': 'Taking Note On The Blackboard',
    },
    {
      'text': 'Backpack',
      'image': 'assets/image/backpack.png',
      'image1': 'assets/image/carrying.png',
      'text1': 'Carrying My Backpack',
      'image2': 'assets/image/i lost.png',
      'text2': 'I Lost My Backpack',
      'image3': 'assets/image/like topic.png',
      'text3': 'I Need a New Backpack',
      'image4': 'assets/image/thank you.png',
      'text4': 'Thank You For Carrying My Backpack',
    },
    {
      'text': 'Notebook',
      'image': 'assets/image/notebook.png',
      'image1': 'assets/image/taking notes.png',
      'text1': 'Taking Notes',
      'image2': 'assets/image/iam taking.png',
      'text2': 'I\'m Taking Notes',
      'image3': 'assets/image/i lost.png',
      'text3': 'I Lost My Notebook',
      'image4': 'assets/image/borrow.png',
      'text4': 'Can I Borrow Your  Notebook ?',
    },
    {
      'text': 'Pencil',
      'image': 'assets/image/pencil.png',
      'image1': 'assets/image/writing.png',
      'text1': 'I\'m Writing',
      'image2': 'assets/image/learning.png',
      'text2': 'I\'m Learning to Write',
      'image3': 'assets/image/borrow.png',
      'text3': 'Can I Borrow Your Pencil ?',
      'image4': 'assets/image/i lost.png',
      'text4': 'I Lost My Pencil',
    },
    {
      'text': 'School bus',
      'image': 'assets/image/school bus.png',
      'image1': 'assets/image/bus coming.png',
      'text1': 'School Bus Is Coming',
      'image2': 'assets/image/Ques.png',
      'text2': 'Can I Sit Next to You ?',
      'image3': 'assets/image/bus driver.png',
      'text3': 'Thank You bus Driver !',
      'image4': 'assets/image/bus late.png',
      'text4': 'School bus Was Late',
    },
    {
      'text': 'Teacher',
      'image': 'assets/image/teacher.png',
      'image1': 'assets/image/dont understand.png',
      'text1': 'I Don\'t Understand This Part',
      'image2': 'assets/image/restroom.png',
      'text2': 'Can I Go to The Restroom ?',
      'image3': 'assets/image/bus driver.png',
      'text3': 'Thank You Teacher !',
      'image4': 'assets/image/heart.png',
      'text4': 'I Like This Topic',
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
                    'School',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.redAccent.shade100,
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
                      Row(children: [
                        const Text(
                        'School',
                        style:  TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _Speak('School');
                            });
                          },
                          icon: const Icon(Icons.volume_up)),
                      ],),
                       Row(children: [TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SchoolTest()));
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
                  borderRadius:  BorderRadius.only(
                      topLeft:  Radius.circular(30),
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
                              color: Colors.redAccent.shade100),
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
                          return ConversationScreen();
                        }));
                      });
                    },
                    child: Expanded(
                      child: Container(
                        width: 185,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(248, 187, 208, 1),
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
                                      'assets/image/conversation.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 7.0),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child:  Text(
                                    'Conversations',
                                    style:  TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (ctx) {
                          return AnimalScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              'Animals',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Container(
                                width: 50,
                                height: 27,
                                decoration: const BoxDecoration(
                                  image:  DecorationImage(
                                    image: AssetImage(
                                      'assets/image/animals.png',
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
