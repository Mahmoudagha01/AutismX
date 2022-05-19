

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/models/Emotion.dart';



enum GameStatus {
  created,
  playing,
  solved,
}

class GameState extends Equatable {
  /// numbers of columns and rows
  final int crossAxisCount;
  final Puzzle puzzle;
  final bool solved;
  final int moves;
  final GameStatus status;
  final bool vibration;
  final bool sound;

  const GameState({
    @required this.crossAxisCount,
    @required this.puzzle,
    @required this.solved,
    @required this.moves,
    @required this.status,
    @required this.vibration,
    @required this.sound,
  }) : assert(crossAxisCount >= 3);

  GameState copyWith({
    int crossAxisCount,
    int moves,
    Puzzle puzzle,
    bool solved,
    GameStatus status,
    bool sound,
    bool vibration,
  }) {
    return GameState(
      status: status ?? this.status,
      moves: moves ?? this.moves,
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      puzzle: puzzle ?? this.puzzle,
      solved: solved ?? this.solved,
      sound: sound ?? this.sound,
      vibration: vibration ?? this.vibration,
    );
  }

  @override
  List<Object> get props => [
        moves,
        crossAxisCount,
        puzzle,
        solved,
        status,
        sound,
        vibration,
      ];
}
