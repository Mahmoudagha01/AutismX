import 'package:autismx/screens/activities/learn_basic/colortest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';



import '../../../shared/local/component.dart';
import 'AnimalScreen.dart';
import 'FoodScreen.dart';


class ColorScreen extends StatefulWidget {
  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

enum ttsstate { playing, stopped }

class _ColorScreenState extends State<ColorScreen> {
  final List<Map<String, dynamic>> _listinfo = [
    {
      'text': 'Crayons',
      'image': 'assets/image/caryons.png',
      'image1': 'assets/image/heart.png',
      'text1': 'I Like Crayons',
      'image2': 'assets/image/can set.png',
      'text2': 'Can You Give Me Crayons ? ',
      'image3': 'assets/image/to draw.png',
      'text3': 'I Want to Draw Using My Crayons',
    },
    {
      'text': 'Red',
      'image': 'assets/image/red.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Red',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Red',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Red Paint ?',
    },
    {
      'text': 'Blue',
      'image': 'assets/image/blue.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Blue',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Blue',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Blue Paint ?',
    },
    {
      'text': 'Orange',
      'image': 'assets/image/orange.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Orange',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Orange',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Orange Paint ?',
    },
    {
      'text': 'Green',
      'image': 'assets/image/green.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Green',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Green',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Green Paint ?',
    },
    {
      'text': 'Yellow',
      'image': 'assets/image/yellow.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Yellow',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Yellow',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Yellow Paint ?',
    },
    {
      'text': 'Purple',
      'image': 'assets/image/purple.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Purple',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Purple',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Purple Paint ?',
    },
    {
      'text': 'Pink',
      'image': 'assets/image/pink.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Pink',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Pink',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Pink Paint ?',
    },
    {
      'text': 'Brown',
      'image': 'assets/image/brown.png',
      'image1': 'assets/image/it color.png',
      'text1': 'It Is Brown',
      'image2': 'assets/image/heart.png',
      'text2': 'My Favorite Color Is Brown',
      'image3': 'assets/image/Ques.png',
      'text3': 'Can You Give Me Brown Paint ?',
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
                    'Colors',
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
        color: Colors.limeAccent.shade100,
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
                      Row(children: [ const Text(
                      'Colors',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                            _Speak('Colors');
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
                                          const ColorTest()));
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
                            color: Colors.limeAccent.shade100,
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
                                    'assets/image/animals.png',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            //Image.asset('assets/image/favorite.png',width: 45,height: 33,fit: BoxFit.fill,),
                            const Padding(
                              padding: EdgeInsets.only(left: 7.0),
                              child: Text(
                                'Animals',
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
                          return FoodScreen();
                        }));
                      });
                    },
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Text(
                                'Food',
                                style:  TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              child: Container(
                                width: 50,
                                height: 33,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/image/food.png',
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
