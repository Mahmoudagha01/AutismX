import 'package:autismx/screens/activities/learn_time/QuarterTwo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../shared/local/component.dart';

class QuarterOne extends StatefulWidget {
  const QuarterOne({Key key}) : super(key: key);

  @override
  State<QuarterOne> createState() => _QuarterOneState();
}

enum ttsstate { playing, stopped }

class _QuarterOneState extends State<QuarterOne> {
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
      backgroundColor: Colors.white,
      body: Column(
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Quarters Hours',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.38,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/1.15.gif',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        '15 Minute',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _Speak('It\'s Quarter Past One O\'Clock');
                      },
                      child: Container(
                        width: 200,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(1, 0),
                                spreadRadius: 0,
                                blurRadius: 4,
                                color: Colors.grey)
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "1",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              "15",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                              ),
                            ),
                            Icon(
                              Icons.volume_up,
                              color: Colors.blue,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
                              return QuarterTwo();
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
            ),
          )
        ],
      ),
    );
  }
}
