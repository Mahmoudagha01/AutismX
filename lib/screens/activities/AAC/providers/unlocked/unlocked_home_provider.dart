
import 'package:flutter/material.dart';

import '../../models/data/data.dart';

class UnlockedHomeProvider extends ChangeNotifier {
  List<String> navigation= [];
  List<String> navigation_names= [];
  bool selectMode = false;
  List<TileModel> hideList = [];
  Map<String, TileModel> selectList = {};

  switchSelectionMode() {
    selectMode = !selectMode;
    clearSelect();
    notifyListeners();
  }

  addToSelect(TileModel tile) {
    selectList[tile.labelKey] = tile;
    notifyListeners();
  }

  removeFromSelect(TileModel tile) {
    selectList.remove(tile.labelKey);
    notifyListeners();
  }

  clearSelect() {
    selectList.clear();
    notifyListeners();
  }

  selectAll(List<TileModel> tileList) {
    tileList.forEach((tile) {
      selectList[tile.labelKey] = tile;
    });
    notifyListeners();
  }

  addToNavigation(String loadBoard) {
    navigation.add(loadBoard);
    notifyListeners();
  }

  removeNavigation(String loadBoard) {
    navigation.removeRange(
        navigation.lastIndexOf(loadBoard), navigation.length - 1);


    notifyListeners();
  }

  popNavigation() {
    navigation.removeLast();
    notifyListeners();
  }

  String prettyNavigation() {
    String t = "";
    navigation?.forEach((element) {
      t = t + element + " > ";
    });
    return t;
  }
}
