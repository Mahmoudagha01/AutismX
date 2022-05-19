import 'package:autismx/screens/activities/learn_basic/peopletest.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


import 'ConversationScreen.dart';


class PeopleScreen extends StatefulWidget {
  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
  
}
enum ttsstate { playing, stopped }
class _PeopleScreenState extends State<PeopleScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Mother',
      'image': 'assets/image/mother.png',
      'image1': 'assets/image/Exc mark.png',
      'text1': 'Mommy !',
      'image2': 'assets/image/i love.png',
      'text2': 'I Love My Mother',
      'image3': 'assets/image/heart.png',
      'text3': 'I Love You Mom',
      'image4': 'assets/image/miss you.png',
      'text4': 'I Miss My Mom',
    },
    {
      'text': 'Father',
      'image': 'assets/image/dad.png',
      'image1': 'assets/image/Exc mark.png',
      'text1': 'Daddy !',
      'image2': 'assets/image/i love.png',
      'text2': 'I Love My Father',
      'image3': 'assets/image/heart.png',
      'text3': 'I Love You Dad',
      'image4': 'assets/image/miss you.png',
      'text4': 'I Miss My Dad',
    },
    {
      'text': 'Grand Parents',
      'image': 'assets/image/grand parents.png',
      'image1': 'assets/image/i love.png',
      'text1': 'I Love My Grand Parents',
      'image2': 'assets/image/heart.png',
      'text2': 'I Love You Grand Parents',
      'image3': 'assets/image/miss you.png',
      'text3': 'I Miss My Grand Parents',
      'image4': 'assets/image/they are.png',
      'text4': 'They Are My Grand Parents',
    },
    {
      'text': 'Sister',
      'image': 'assets/image/sister.png',
      'image1': 'assets/image/i love.png',
      'text1': 'I Love My Sister',
      'image2': 'assets/image/heart.png',
      'text2': 'I Love You Sister',
      'image3': 'assets/image/miss you.png',
      'text3': 'I Miss My Sister',
      'image4': 'assets/image/they are.png',
      'text4': 'She Is My Sister',
    },
    {
      'text': 'Brother',
      'image': 'assets/image/brother.png',
      'image1': 'assets/image/i love.png',
      'text1': 'I Love My Brother',
      'image2': 'assets/image/heart.png',
      'text2': 'I Love You Brother',
      'image3': 'assets/image/miss you.png',
      'text3': 'I Miss My Brother',
      'image4': 'assets/image/they are.png',
      'text4': 'He Is My Brother',
    },
    {
      'text': 'Aunt',
      'image': 'assets/image/aunt.png',
      'image1': 'assets/image/i love.png',
      'text1': 'I Love My Aunt',
      'image2': 'assets/image/heart.png',
      'text2': 'I Love You Aunt',
      'image3': 'assets/image/miss you.png',
      'text3': 'I Miss My Aunt',
      'image4': 'assets/image/they are.png',
      'text4': 'She Is My Aunt',
    },
    {
      'text': 'Uncle',
      'image': 'assets/image/uncle.png',
      'image1': 'assets/image/i love.png',
      'text1': 'I Love My Uncle',
      'image2': 'assets/image/heart.png',
      'text2': 'I Love You Uncle',
      'image3': 'assets/image/miss you.png',
      'text3': 'I Miss My Uncle',
      'image4': 'assets/image/they are.png',
      'text4': 'He Is My Uncle',
    },
    {
      'text': 'Parents',
      'image': 'assets/image/parents.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Love My Parents',
      'image2': 'assets/image/miss you.png',
      'text2': 'I Miss My Parents',
      'image3': 'assets/image/they are.png',
      'text3': 'They Are My Parents',
      'image4': 'assets/image/Ques.png',
      'text4': 'Can You Help Me Find My Parents ?',
    },
    {
      'text': 'Teacher',
      'image': 'assets/image/teacher2.png',
      'image1': 'assets/image/i love.png',
      'text1': 'I Love My Teacher',
      'image2': 'assets/image/heart.png',
      'text2': 'I Love You Teacher',
      'image3': 'assets/image/miss you.png',
      'text3': 'I Miss My Teacher',
      'image4': 'assets/image/they are.png',
      'text4': 'She Is My Teacher',
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
                    'People',
                    style:  TextStyle(
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
                            width: 40,
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
        color: Colors.lightBlueAccent.shade100,
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
                         children: [const Text(
                      'People',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                            _Speak('People');
                          });
                    }
                    , icon: const Icon(Icons.volume_up)),],
                       ),
                    Row(children: [TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const PeopleTest()));
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
                            color: Colors.lightBlueAccent.shade100,
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
                mainAxisAlignment: MainAxisAlignment.center,
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
                            const Text(
                              'Conversations',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Container(
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
