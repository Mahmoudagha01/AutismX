import 'package:autismx/screens/activities/learn_time/Answer.dart';
import 'package:autismx/screens/activities/learn_time/QuarterOne.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../shared/local/component.dart';

class ExactTest extends StatefulWidget {
  @override
  State<ExactTest> createState() => _ExactTestState();
}

enum TtsState { playing, stopped }

class _ExactTestState extends State<ExactTest> {
  FlutterTts flutterTts;
  TtsState ttsState = TtsState.playing;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _Speak(String text) async {
    List<dynamic> languages = await flutterTts.getLanguages;

    await flutterTts.setLanguage("en-US");

    await flutterTts.speak(text);
  }

  int currentindex = 0;
  final List<Map<String, Object>> _Question = [
    {
      'Question': 'What Time is it in The Clock ?',
      'answer': [
        {
          'text': ' 7    :    00',
          'score': true,
        },
        {
          'text': '8    :    00',
          'score': false,
        },
        {
          'text': '9    :    00',
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

  // @override
  // void initState() {
  //   super.initState();
  //    initTts();
  //    _Speak("What is Time in The Clock");
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   flutterTts.stop();
  // }

  @override
  void initState() {
    initTts();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
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
                          'assets/images/exact test.png',
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
                  ...(_Question[currentindex]['answer'] as List<Map>).map(
                    (item) => Answer(
                        text: item['text'],
                        colorbutton: Selected
                            ? item['score']
                                ? const Color.fromRGBO(26, 188, 156, 1)
                                : Colors.redAccent
                            : null,
                        colortext: Selected ? Colors.white : Colors.blue,
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
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) {
                            return const QuarterOne();
                          }),
                        );
                      },
                      child: const Text(
                        'Next',
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
          ))
        ]),
      ),
    );
  }
}
