
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import '../../../models/data/data.dart';
import '../../../providers/locked/home.dart';
import '../../../stylesheets/constants.dart';
import 'tts_speak_button.dart';

class ExpandTextScreen extends StatefulWidget {
  final String text;

  const ExpandTextScreen({Key key, this.text}) : super(key: key);

  @override
  _ExpandTextScreenState createState() => _ExpandTextScreenState();
}

class _ExpandTextScreenState extends State<ExpandTextScreen> {
  TextEditingController textController = TextEditingController();
  FlutterTts tts = FlutterTts();
  String _speakContent;

  @override
  void initState() {
    super.initState();
    textController.text = widget.text;
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeModel = Provider.of<HomeModel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    _createTile(String text) {
      return TileModel(id: text.split(" ")[0], labelKey: text, image: null);
    }

    _previousButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: blue),
          child: const Icon(
            Icons.arrow_left,
            color: white,
            size: 30.0,
          ),
        ),
      );
    }

    _addTileButton() {
      return GestureDetector(
        onTap: () {
          // final content = textController.text;

          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: blue),
          child: const Icon(
            Icons.bookmark,
            color: white,
            size: 30.0,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth / 8),
            height: screenHeight / 2,
            child: TextField(
              style: const TextStyle(height: 1.3, color: Colors.black),
              // cursorHeight: 3.0,
              autofocus: true,
              controller: textController,
              decoration: null,
              textInputAction: TextInputAction.done,
              maxLines: null,
              onChanged: (String text) {
                setState(() {
                  _speakContent = text;
                });
              },
              onSubmitted: (String text) {
                print(text);
                final tile = _createTile(text);
                print(tile);
                homeModel.addWords(tile);
                textController.clear();
                Navigator.pop(context);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _previousButton(),
              SizedBox(
                width: screenWidth / 4,
              ),
              _addTileButton(),
              SizedBox(
                width: screenWidth / 4,
              ),
              SpeakTileButton(text: _speakContent)
            ],
          ),
        ],
      )),
    );
  }
}
