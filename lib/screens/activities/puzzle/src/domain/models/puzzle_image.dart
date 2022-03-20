import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class PuzzleImage extends Equatable {
  final String name;
  final String assetPath;
  final String soundPath;

  const PuzzleImage({
    @required this.name,
    @required this.assetPath,
    @required this.soundPath,
  });

  @override
  List<Object> get props => [
        name,
        assetPath,
        soundPath,
      ];
}
