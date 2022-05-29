import 'dart:async';
import 'dart:typed_data';

import 'package:autismx/screens/activities/Emotion/src/domain/models/Emotion.dart';
import 'package:autismx/screens/activities/Emotion/src/ui/pages/game/controller/game_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/models/Emotion_image.dart';
import '../../../../domain/models/tile.dart';
import '../../../../domain/repositories/audio_repository.dart';



class GameController extends ChangeNotifier {
  final AudioRepository audioRepository = GetIt.I.get();

  GameState _state = GameState(
    crossAxisCount: 3,
    puzzle: Puzzle.create(3),
    solved: false,
    moves: 0,
    status: GameStatus.created,
    sound: true,
    vibration: true,
  );

  final ValueNotifier<int> time = ValueNotifier(0);

  final StreamController<void> _streamController = StreamController.broadcast();

  Stream<void> get onFinish => _streamController.stream;

  Timer _timer;

  GameState get state => _state;

  Puzzle get puzzle => _state.puzzle;

  void onTileTapped(Tile tile) {
    final canMove = puzzle.canMove(tile.position);

    if (canMove) {
  
      final newPuzzle = puzzle.move(tile);

      
      final solved = newPuzzle.isSolved();
      _state = state.copyWith(
        puzzle: newPuzzle,
        moves: state.moves + 1,
        status: solved ? GameStatus.solved : state.status,
      );
      notifyListeners();

      if (state.vibration) {
        HapticFeedback.lightImpact();
      }

      if (state.sound) {
   
        audioRepository.playMove();
      }

      if (solved) {
        _timer?.cancel();

  
        _streamController.sink.add(null);
      }
    }
  }

  void shuffle() {
    if (_timer != null) {
      time.value = 0;
      _timer.cancel();
    }
    _state = state.copyWith(
      puzzle: puzzle.shuffle(),
      status: GameStatus.playing,
      moves: 0,
    );
    notifyListeners();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        time.value++;
      },
    );
  }

  /// change the current size of the puzzle
  ///
  ///
  /// [crossAxisCount] number of rows and columns
  ///
  /// [image] is different of null when the puzzle
  /// has to be a segmented image
  Future<void> changeGrid(
    int crossAxisCount,
   EmotionImage image,
  ) async {
    _timer?.cancel();
    time.value = 0;

    List<Uint8List> segmentedImage;

   

    /// reset the game with a new puzzle
    final newState = GameState(
      crossAxisCount: crossAxisCount,
      puzzle: Puzzle.create(
        crossAxisCount,
        segmentedImage: segmentedImage,
        image: image,
      ),
      solved: false,
      moves: 0,
      status: GameStatus.created,
      sound: state.sound,
      vibration: state.vibration,
    );
    _state = newState;
    notifyListeners();
  }

  void toggleSound() {
    _state = state.copyWith(
      sound: !state.sound,
    );
    notifyListeners();
  }

  void toggleVibration() {
    _state = state.copyWith(
      vibration: !state.vibration,
    );
    notifyListeners();
  }

  /// handle the keyboard events and  check if
  /// the keyboard action can move a tile using as
  /// reference the empty position


  /// handle the keyboard events and  check if
  /// the keyboard action can move a tile using as
  /// reference the empty position
  ///
  /// return [int] the index tile to be moved, if any
  /// tile can be moved the value returned is null


  /// release memory
  @override
  void dispose() {
    _streamController.close();
    _timer?.cancel();
    super.dispose();
  }
}
