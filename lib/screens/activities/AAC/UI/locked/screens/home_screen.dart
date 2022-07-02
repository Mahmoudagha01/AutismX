import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import '../../../models/data/data.dart';
import '../../../providers/locked/dialog.dart';
import '../../../providers/locked/home.dart';
import '../../../stylesheets/constants.dart';
import '../widgets/expand_text_screen.dart';
import '../widgets/folderWidget.dart';
import '../widgets/main_app_bar.dart';
import '../widgets/sentence_bar.dart';
import '../widgets/tileWidget.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, FolderModel> data;
  final String boardId;

  const HomeScreen({Key key, @required this.data, @required this.boardId})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum TtsState { playing, stopped }

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController; //enable scrolling the screen
  double _scrollOffset = 0.0;
//implement Flutter tts
  FlutterTts flutterTts = FlutterTts();
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
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

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    initTts();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Keep track of screen size
    final Size screenSize = MediaQuery.of(context).size;

    //State management model
    final dialologModel = Provider.of<DialogModel>(context);
    final homeModel = Provider.of<HomeModel>(context);

    final data = widget.data;
    final FolderModel folderModel = widget.data[widget.boardId];

    
    Future _speak(String text) async {
      List<dynamic> languages = await flutterTts.getLanguages;

      await flutterTts.setLanguage("en-US");

      await flutterTts.setSpeechRate(0.3);

      await flutterTts.setVolume(1.0);

      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }

    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenSize.height * 0.2),
        child: Container(
          // Avoid overlapping with phone's top display stuff
          margin: const EdgeInsets.only(top: 25.0),
          // Top two bars
          child: Column(
            children: <Widget>[
              // Sentence Creation Section
              Expanded(
                flex: 3,
                // height: screenSize.height * (2 / 15),
                child: SentenceBar(
                  //Speak full sentence
                  tapped: () => _speak(homeModel.getFullSent()),
                ),
              ),
              // Main Navigation Bar
              Expanded(
                flex: 2,
                child: MainAppBar(scrollOffset: _scrollOffset),
              ),
            ],
          ),
        ),
      ),
      //AAC Home Ui
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 7.0,
        ),
        // Add list of tiles from database together with 2 tiles for 'Add text' and 'Add tile/folder'
        itemCount: folderModel.subItems.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return TileWidget(
                labelPos: dialologModel.tileLabelTop,
                text: "Add text",
                content: 'assets/symbols/mulberry/a_-_lower_case.svg',
                color: soft_green,
                //User taps to add sentence in the top sentence bar
                tapped: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ExpandTextScreen()))
                    });
          } else {
            final TileModel tileInfo = folderModel.subItems[index - 1];
            String title = tileInfo.labelKey.split('.').last;
            if (tileInfo.loadBoard == null) {
              return TileWidget(
                labelPos: dialologModel.tileLabelTop,
                text: title,
                content: 'assets' + tileInfo.image,
                color: dialologModel.tileBackgroundColor,
                labelColor: dialologModel.tileTextColor,
                tapped: () => {
                  //Speak word in the tile
                  _speak(title),
                  setState(() {
                    homeModel.addWords(tileInfo);
                  })
                },
              );
            } else {
              TileModel folderInfo = tileInfo;
              return FolderWidget(
                text: tileInfo.labelKey.split('.').last,
                content: 'assets' + tileInfo.image,
                boardId: folderInfo.loadBoard,
                color: dialologModel.folderBackgroundColor,
                labelColor: dialologModel.folderTextColor,
                labelPos: dialologModel.folderLabelTop,
              );
            }
          }
        },
      ),
    );
  }
}
