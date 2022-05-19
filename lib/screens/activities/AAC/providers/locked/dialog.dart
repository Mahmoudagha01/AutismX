
import 'package:flutter/cupertino.dart';

import '../../stylesheets/constants.dart';

enum labelSize { Small, Medium, Large, Extra_large }

//To manage screen of edit dialogs
class DialogModel with ChangeNotifier {
  int _currentState = 1;
  Color _tileTextColor = dark_blue;
  Color _tileBackgroundColor = dark_lime_green;
  Color _folderTextColor = dark_blue;
  Color _folderBackgroundColor = dark_blue;
  labelSize _tileLabelSizeOption = labelSize.Large;
  labelSize _folderLabelSizeOption = labelSize.Large;
  bool _tileLabelTop = false;
  bool _folderLabelTop = false;

  labelSize get currentTileLabelSize => _tileLabelSizeOption;

  void updateTileLabelSize(labelSize newSize) {
    _tileLabelSizeOption = newSize;
    notifyListeners();
  }

  labelSize get currentFolderLabelSize => _folderLabelSizeOption;

  void updateFolderLabelSize(labelSize newSize) {
    _folderLabelSizeOption = newSize;
    notifyListeners();
  }

  int get currentState => _currentState;

  void updateState(int newState) {
    _currentState = newState;
    notifyListeners();
  }

  Color get tileTextColor => _tileTextColor;

  void updateTileTextColor(Color newColor) {
    _tileTextColor = newColor;
    notifyListeners();
  }

  Color get tileBackgroundColor => _tileBackgroundColor;

  void updateTileBackgroundColor(Color newColor) {
    _tileBackgroundColor = newColor;
    notifyListeners();
  }

  Color get folderTextColor => _folderTextColor;

  void updateFolderTextColor(Color newColor) {
    _folderTextColor = newColor;
    notifyListeners();
  }

  Color get folderBackgroundColor => _folderBackgroundColor;

  void updateFolderBackgroundColor(Color newColor) {
    _folderBackgroundColor = newColor;
    notifyListeners();
  }

  bool get tileLabelTop => _tileLabelTop;

  void updateTileLabelPos(bool newPos) {
    _tileLabelTop = newPos;
    notifyListeners();
  }

  bool get folderLabelTop => _folderLabelTop;

  void updateFolderLabelPos(bool newPos) {
    _folderLabelTop = newPos;
    notifyListeners();
  }
}
