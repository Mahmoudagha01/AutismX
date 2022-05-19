import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../stylesheets/constants.dart';

class SpeakTileButton extends StatefulWidget {
  final text;

  const SpeakTileButton({Key key, this.text}) : super(key: key);

  @override
  _SpeakTileButtonState createState() => _SpeakTileButtonState();
}

enum TtsState { playing, stopped }

class _SpeakTileButtonState extends State<SpeakTileButton> {
  FlutterTts tts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  Future _speak(String text) async {
    
    List<dynamic> languages = await tts.getLanguages;

    await tts.setLanguage("en-US");

    await tts.setSpeechRate(1.0);

    await tts.setVolume(1.0);

    await tts.setPitch(1.0);

    await tts.speak(text);
  }

  initTts() {
    tts = FlutterTts();

    tts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    tts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    tts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    _setVolume();
  }

  _setVolume() async {
    await tts.setVolume(1.0);

    await tts.setSpeechRate(0.6);
  }

  @override
  void initState() {
    super.initState();

    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    tts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _speak(widget.text);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        // width: MediaQuery.of(context).size.width/10,
        // height: MediaQuery.of(context).size.height/50,
        //  color: Colors.orange,
        decoration: const BoxDecoration(
            color: tangerine,
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: const Icon(
          Icons.volume_up,
          color: white,
          size: 30.0,
        ),
      ),
    );
  }
}
