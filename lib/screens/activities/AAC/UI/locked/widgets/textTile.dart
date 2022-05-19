
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/locked/dialog.dart';
import '../../../stylesheets/constants.dart';
import 'tileWidget.dart';

class TextTile extends StatefulWidget {
  @override
  _EditTile createState() => _EditTile();
}

class _EditTile extends State<TextTile> {
  //Check if tile is in editting mode or not
  bool _isEditingText = true;
  TextEditingController _editingController;

  //Init sentence to be empty
  String sentence = "";

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: sentence);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Listen to any changes from provider about label position
    final dialogModel = Provider.of<DialogModel>(context);

    //Tile to add sentence
    Widget _editTitleTextField() {
      //Show textfield if tile is in editting mode
      if (_isEditingText) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            onSubmitted: (newValue) {
              setState(() {
                sentence = newValue;
                _isEditingText = false;
              });
            },
            autofocus: true,
            controller: _editingController,
            decoration: null,
            maxLines: null,
          ),
        );
      }
      //else show normal tile with text as main content
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        child: TileWidget(
          text: "Edit",
          content: sentence,
          color: fog,
          labelPos: dialogModel.tileLabelTop,
          edittingTile: true,
          tapped: () {
            setState(() {
              _isEditingText = true;
            });
          },
        ),
      );
    }

    return _editTitleTextField();
  }
}
