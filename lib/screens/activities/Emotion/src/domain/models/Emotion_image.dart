import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class EmotionImage extends Equatable {
  final String name;
  final String assetPath;
  final String soundPath;
  final String gifPath;
  const EmotionImage({
    @required this.name,
    @required this.assetPath,
    @required this.soundPath,
     @required this.gifPath,
  });

  @override
  List<Object> get props => [
        name,
        assetPath,
        soundPath,
        gifPath
      ];
}
