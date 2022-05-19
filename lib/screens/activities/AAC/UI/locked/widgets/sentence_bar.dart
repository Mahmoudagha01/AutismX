


import 'package:autismx/screens/activities/AAC/UI/locked/widgets/expand_text_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import '../../../models/data/data.dart';
import '../../../providers/locked/dialog.dart';
import '../../../providers/locked/home.dart';
import '../../../stylesheets/constants.dart';
import 'tileWidget.dart';

class SentenceBar extends StatefulWidget {
  final Function() tapped;

  const SentenceBar({Key key, this.tapped}) : super(key: key);

  @override
  _SentenceBarState createState() => _SentenceBarState();
}

class _SentenceBarState extends State<SentenceBar> {
  bool _enterText = false, _expandView = false;
  TextEditingController textController = TextEditingController();
  FlutterTts tts = FlutterTts();
  FocusNode enterTextFocusNode;

  @override
  void initState() {
    super.initState();
    enterTextFocusNode = FocusNode();
  }

  @override
  void dispose() {
    enterTextFocusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  _createTile(String text) {
    return TileModel(id: text.split(" ")[0], labelKey: text, image: null);
  }

  @override
  Widget build(BuildContext context) {
    final dialogModel = Provider.of<DialogModel>(context);
    final homeModel = Provider.of<HomeModel>(context);
    final words = homeModel.getWords();

    Future _speak(String text) async {
      List<dynamic> languages = await tts.getLanguages;

await tts.setLanguage("en-US");

await tts.setSpeechRate(0.3);

await tts.setVolume(1.0);

await tts.setPitch(1.0);

      await tts.speak(text);
    }

    return Row(
      children: [
        const SizedBox(width: 3),
        Expanded(
            child: GestureDetector(
          onTap: () {
            setState(() {
              _enterText = true;
            });
          },
          child: _enterText == true
              ? TextField(
                focusNode: enterTextFocusNode,
                autofocus: true,
                style: const TextStyle(height: 1.3, color: Colors.black),
                // cursorHeight: 3.0,
                controller: textController,
                decoration: null,
                textInputAction: TextInputAction.done,
                maxLines: null,
                onSubmitted: (String text) {
                  if (text != null && text.isNotEmpty) {
                    final tile = _createTile(text);
                    homeModel.addWords(tile);
                  }
                  setState(() {
                    _enterText = false;
                  });
                  textController.clear();
                  enterTextFocusNode.unfocus();
                },
              )
              : words.isEmpty
                  ? const Text(
                      'Enter text or add tiles',
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      //User can scroll tiles horizontally
                      scrollDirection: Axis.horizontal,
                      itemCount: words.length,
                      itemBuilder: (BuildContext context, int index) {
                        TileModel tileInfo = words[index];
                        String title = tileInfo.labelKey.split('.').last;
                        return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: TileWidget(
                              labelPos: dialogModel.tileLabelTop,
                              text: title,
                              content: (tileInfo.image != null)
                                  ? "assets" + tileInfo.image
                                  : "assets/symbols/A.svg",
                              color: dialogModel.tileBackgroundColor,
                              labelColor: dialogModel.tileTextColor,
                              tapped: () => {
                                //Speak word in the tile
                                _speak(title),
                              },
                            )
                            // Tile(
                            //   text: tileData.id,
                            //   content: (tileData.image == null) ? tileData.labelKey : tileData.image,
                            //   color: dialogModel.tileBackgroundColor,
                            //   labelPos: dialogModel.tileLabelTop,
                            //   edittingTile: true,
                            //   tapped: (){
                            //     // print(tileData.isText);
                            //     if(tileData.image == null){
                            //       _speak(tileData.labelKey);
                            //     }
                            //     else{
                            //       _speak(tileData.id);
                            //     }
                            //   }
                            // ),
                            );
                        // // //If tile is for adding user text input, create TextTile()
                        // // if (tileData.name == "Edit") {
                        // //   return TextTile();
                        // //   //else create normal tile
                        // // }
                        // if(tileData.name == "Text"){
                        //   return SizedBox(
                        //     width: MediaQuery.of(context).size.width * 0.2,
                        //     child: Tile(
                        //       text: tileData.name,
                        //       content: tileData.content,
                        //       color: dialogModel.tileBackgroundColor,
                        //       labelPos: dialogModel.labelTop,
                        //       edittingTile: true,
                        //       tapped: (){
                        //         _speak(tileData.content);
                        //       }
                        //     ),
                        //   );
                        // }
                        //  else {

                        // }
                      },
                    ),
        )),
        const SizedBox(width: 5),
        // Backspace Button
        GestureDetector(
          onTap: () {
            setState(() {
              if (words.isNotEmpty) {
                words.removeLast();
              }
            });
          },
          child: _enterText == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _speak(textController.text);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        // width: MediaQuery.of(context).size.width/10,
                        // height: MediaQuery.of(context).size.height/50,
                        //  color: Colors.orange,
                        decoration: const BoxDecoration(
                            color: tangerine,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: const Icon(
                          Icons.volume_up,
                          color: white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        print("Tapped!");
                        setState(() {
                          _enterText = false;
                        });
                        String text = textController.text;
                        textController.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExpandTextScreen(
                                      text: text,
                                    )));
                      },
                      child: Icon(
                        Icons.open_in_full,
                        color: Theme.of(context).primaryColor,
                        size: 25.0,
                      ),
                    )
                  ],
                )
              : Icon(
                  Icons.backspace,
                  color: Theme.of(context).primaryColor,
                  size: 25.0,
                ),
        ),
        const SizedBox(width: 5),
      ],
    );

    /*
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 3),
        Expanded(
          child: words.length == 0
              ? Text(
                  'Enter text or add tiles',
                )
              : GestureDetector(
                  onTap: widget.tapped,
                  child: ListView.builder(
                    //User can scroll tiles horizontally
                    scrollDirection: Axis.horizontal,
                    itemCount: words.length,
                    itemBuilder: (BuildContext context, int index) {
                      TileData tileInfo = words[index];
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Tile(
                          text: tileInfo.labelKey.split('.').last,
                          content: 'assets' + tileInfo.image,
                          color: dialogModel.tileBackgroundColor,
                          labelPos: dialogModel.tileLabelTop,
                          labelColor: dialogModel.tileTextColor,
                        ),
                      );
                      // //If tile is for adding user text input, create TextTile()
                      // if (tileData.name == "Edit") {
                      //   return TextTile();
                      //   //else create normal tile
                      // }
                      // else {
                      //   return SizedBox(
                      //     width: MediaQuery.of(context).size.width * 0.2,
                      //     child: Tile(
                      //       text: tileData.name,
                      //       content: tileData.content,
                      //       color: dialogModel.tileBackgroundColor,
                      //       labelPos: dialogModel.tileLabelTop,
                      //     ),
                      //   );
                      // }
                    },
                  ),
                ),
        ),
        SizedBox(width: 5),
        // Backspace Button
        GestureDetector(
          onTap: () {
            setState(() {
              homeModel.removeWords();
            });
          },
          child: Icon(
            Icons.backspace,
            color: Theme.of(context).primaryColor,
            size: 25.0,
          ),
        ),
        SizedBox(width: 5),
      ],
    );*/
  }
}
