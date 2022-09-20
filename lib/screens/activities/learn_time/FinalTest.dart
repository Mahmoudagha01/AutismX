import 'package:autismx/screens/activities/learn_time/Answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../shared/local/component.dart';

class FinalTest extends StatefulWidget {
  @override
  State<FinalTest> createState() => _FinalTestState();
}

enum ttsstate { playing, stopped }

class _FinalTestState extends State<FinalTest> {
  FlutterTts flutterTts;
  ttsstate TtsState = ttsstate.stopped;
  get isplaying => TtsState == ttsstate.playing;
  get isstopped => TtsState == ttsstate.stopped;

  Future _Speak(String text) async {
    await flutterTts.speak(text);
    List<dynamic> languages = await flutterTts.getLanguages;

    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(0.3);

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

  int currentindex = 0;
  final List<Map<String, Object>> _Question = [
    {
      'Question': 'What Time is it in The Clock ?',
      'answer': [
        {
          'text': '10  :  35   AM',
          'score': false,
        },
        {
          'text': '10  :  25   AM',
          'score': true,
        },
        {
          'text': '10  :  45   PM ',
          'score': false,
        },
      ],
    },
  ];
  bool Selected = false;
  bool Iscorrectanswer = false;
  Questionanswer(bool answerscore) {
    setState(() {
      Selected = true;
      if (answerscore == true) {
        Iscorrectanswer = true;
      }
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
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                CustombackAppBar(context, () {
                  Navigator.pop(context);
                }),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.28,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/test.gif',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'What is The Time ?',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                    onPressed: () {
                                      _Speak("What is The Time ?");
                                    },
                                    icon: const Icon(
                                      Icons.volume_up,
                                      color: Colors.blue,
                                    ))
                              ],
                            ),
                          ),
                          ...(_Question[currentindex]['answer'] as List<Map>)
                              .map(
                            (item) => Answer(
                                text: item['text'],
                                colorbutton: Selected
                                    ? item['score']
                                        ? const Color.fromRGBO(26, 188, 156, 1)
                                        : Colors.redAccent
                                    : null,
                                colortext:
                                    Selected ? Colors.white : Colors.blue,
                                Answertap: () {
                                  if (Selected) {
                                    return;
                                  }
                                  Questionanswer(item['score']);
                                }),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 150,
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        elevation: 10,
                                        content: Container(
                                          height: 215,
                                          width: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 160,
                                                height: 150,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/con3.gif',
                                                      ),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              Divider(
                                                height: 2,
                                                thickness: 2,
                                                color:
                                                    Colors.blueAccent.shade100,
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                  'Congratulation',
                                                  style: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Text(
                                                'Well Done ! ',
                                                style: TextStyle(
                                                    color: Colors.blue[900],
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
