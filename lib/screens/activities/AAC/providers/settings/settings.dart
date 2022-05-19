
import 'package:flutter/material.dart';

enum size { Standard, Large, ExtraLarge }
enum voice { Female, Male, Robot, Funny }
enum scanningMethod { Automatic, Manual }

class SettingsModel extends ChangeNotifier {
  String _locale;

  bool _darkTheme = false;

  bool _predictiveText = false;

  bool _outputBar = false;

  size _uiSize = size.Standard;

  size _fontSize = size.Standard;

  voice _voiceType = voice.Female;

  double _pitch = 20;

  double _rate = 20;

  bool _backButton = true;

  bool _symbolRemovable = true;

  bool _quickSettingUnlock = false;

  bool _folderVocal = true;

  bool _boardScanned = false;

  double _timeDelay = 2;

  scanningMethod _method = scanningMethod.Automatic;

  //Getters
  Locale get locale => Locale(_locale.split("-")[0], _locale.split("-")[1]);

  bool get darkTheme => _darkTheme;

  bool get predictiveText => _predictiveText;

  bool get outputBar => _outputBar;

  size get uiSize => _uiSize;

  size get fontSize => _fontSize;

  voice get voiceType => _voiceType;

  double get pitch => _pitch;

  double get rate => _rate;

  bool get backButton => _backButton;

  bool get symbolRemovable => _symbolRemovable;

  bool get quickSettingUnlock => _quickSettingUnlock;

  bool get folderVocal => _folderVocal;

  bool get boardScanned => _boardScanned;

  double get timeDelay => _timeDelay;

  scanningMethod get method => _method;

  //Setters
  void updateLocale(String locale) {
    _locale = locale;
    notifyListeners();
  }

  void toggleDarkTheme(bool newVal) {
    _darkTheme = newVal;
    notifyListeners();
  }

  void updatePredictiveText(bool newVal) {
    _predictiveText = newVal;
    notifyListeners();
  }

  void updateOutputBar(bool newVal) {
    _outputBar = newVal;
    notifyListeners();
  }

  void updateUiSize(size newSize) {
    _uiSize = newSize;
    notifyListeners();
  }

  void updateFontSize(size newSize) {
    _fontSize = newSize;
    notifyListeners();
  }

  void updateVoice(voice newVoice) {
    _voiceType = newVoice;
    notifyListeners();
  }

  void updatePitch(double newVal) {
    _pitch = newVal;
    notifyListeners();
  }

  void updateRate(double newVal) {
    _rate = newVal;
    notifyListeners();
  }

  void updateBackButton() {
    _backButton = !_backButton;
    notifyListeners();
  }

  void updateSymbolRemove() {
    _symbolRemovable = !_symbolRemovable;
    notifyListeners();
  }

  void updateQuickSetting() {
    _quickSettingUnlock = !_quickSettingUnlock;
    notifyListeners();
  }

  void updateFolderUnlock() {
    _folderVocal = !_folderVocal;
    notifyListeners();
  }

  void updateBoardScanned() {
    _boardScanned = !_boardScanned;
    notifyListeners();
  }

  void updateTimeDelay(double newVal) {
    _timeDelay = newVal;
    notifyListeners();
  }

  void updateMethod(scanningMethod newMedthod) {
    _method = newMedthod;
    notifyListeners();
  }
}
