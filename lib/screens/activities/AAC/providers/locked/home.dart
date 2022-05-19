
import 'package:flutter/material.dart';

import '../../models/data/data.dart';


class HomeModel extends ChangeNotifier {
  List<TileModel> words = [];
  String fullSent = "";


  void addWords(TileModel newTile) {
    words.add(newTile);
    //For adding sentence to top bar
    // String newWord = newTile.name != "Edit" ? newTile.name : newTile.content;
    String newWord = newTile.labelKey.split('.').last;
    fullSent += newWord + ". ";
   print(fullSent);
    notifyListeners();
  }

  List<TileModel> getWords() {
    return words;
  }

  void removeWords() {
    if (words.isNotEmpty) {
      fullSent = fullSent.substring(
          0, fullSent.length - words.last.labelKey.split('.').last.length - 2);
      words.removeLast();
    }
    notifyListeners();
  }

  String getFullSent() {
    return fullSent;
  }

  


}
