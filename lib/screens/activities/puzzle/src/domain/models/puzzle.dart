import 'dart:typed_data';
import 'package:autismx/screens/activities/puzzle/src/domain/models/position.dart';
import 'package:autismx/screens/activities/puzzle/src/domain/models/puzzle_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'tile.dart';
import 'dart:math' as math;

class Puzzle extends Equatable {
  final List<Tile> tiles;

  final Position emptyPosition;

  final List<Uint8List> segmentedImage;

  final PuzzleImage image;

  const Puzzle._({
    @required this.tiles,
    @required this.emptyPosition,
    @required this.image,
    @required this.segmentedImage,
  });

  bool canMove(Position tilePosition) {
    if (tilePosition.x == emptyPosition.x ||
        tilePosition.y == emptyPosition.y) {
      return true;
    }
    return false;
  }

  Puzzle move(Tile tile) {
    final copy = [...tiles];

    if (tile.position.y == emptyPosition.y) {
      final row = tiles.where(
        (e) => e.position.y == emptyPosition.y,
      );

      if (tile.position.x < emptyPosition.x) {
        for (final e in row) {
          if (e.position.x < tile.position.x ||
              e.position.x > emptyPosition.x) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x + 1,
              y: e.position.y,
            ),
          );
        }
      } else {
        for (final e in row) {
          if (e.position.x > tile.position.x ||
              e.position.x < emptyPosition.x) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x - 1,
              y: e.position.y,
            ),
          );
        }
      }
    } else {
      final column = tiles.where(
        (e) => e.position.x == emptyPosition.x,
      );

      if (tile.position.y < emptyPosition.y) {
        for (final e in column) {
          if (e.position.y > emptyPosition.y ||
              e.position.y < tile.position.y) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x,
              y: e.position.y + 1,
            ),
          );
        }
      } else {
        for (final e in column) {
          if (e.position.y < emptyPosition.y ||
              e.position.y > tile.position.y) {
            continue;
          }
          copy[e.value - 1] = e.move(
            Position(
              x: e.position.x,
              y: e.position.y - 1,
            ),
          );
        }
      }
    }
    return Puzzle._(
      tiles: copy,
      emptyPosition: tile.position,
      image: image,
      segmentedImage: segmentedImage,
    );
  }

  factory Puzzle.create(
    int crossAxisCount, {
    List<Uint8List> segmentedImage,
    PuzzleImage image,
  }) {
    int value = 1;
    final tiles = <Tile>[];

    final emptyPosition = Position(
      x: crossAxisCount,
      y: crossAxisCount,
    );
    for (int y = 1; y <= crossAxisCount; y++) {
      for (int x = 1; x <= crossAxisCount; x++) {
        final add = !(x == crossAxisCount && y == crossAxisCount);
        if (add) {
          final position = Position(x: x, y: y);
          final tile = Tile(
            value: value,
            position: position,
            correctPosition: position,
          );
          tiles.add(tile);
          value++;
        }
      }
    }

    return Puzzle._(
      tiles: tiles,
      emptyPosition: emptyPosition,
      image: image,
      segmentedImage: segmentedImage,
    );
  }

  Puzzle shuffle() {
    final values = List.generate(
      tiles.length,
      (index) => index + 1,
    );
    values.add(0);
    values.shuffle();

    if (_isSolvable(values)) {
      int x = 1, y = 1;
      Position emptyPosition;
      final copy = [...tiles];
      final int crossAxisCount = math.sqrt(values.length).toInt();

      for (int i = 0; i < values.length; i++) {
        final value = values[i];
        final position = Position(x: x, y: y);
        if (value == 0) {
          emptyPosition = position;
        } else {
          copy[value - 1] = copy[value - 1].move(
            position,
          );
        }

        if ((i + 1) % crossAxisCount == 0) {
          y++;
          x = 1;
        } else {
          x++;
        }
      }

      return Puzzle._(
        tiles: copy,
        emptyPosition: emptyPosition,
        image: image,
        segmentedImage: segmentedImage,
      );
    } else {
      return shuffle();
    }
  }

  bool _isSolvable(List<int> values) {
    final n = math.sqrt(values.length);
    int inversions = 0;
    int y = 1;
    int emptyPositionY = 1;

    for (int i = 0; i < values.length; i++) {
      if (i > 0 && i % n == 0) {
        y++;
      }

      final current = values[i];
      if (current == 1 || current == 0) {
        if (current == 0) {
          emptyPositionY = y;
        }
        continue;
      }
      for (int j = i + 1; j < values.length; j++) {
        final next = values[j];

        if (current > next && next != 0) {
          inversions++;
        }
      }
    }

    if (n % 2 != 0) {
      return inversions % 2 == 0;
    } else {
      final yFromBottom = n - emptyPositionY + 1;

      if (yFromBottom % 2 == 0) {
        return inversions % 2 != 0;
      } else {
        return inversions % 2 == 0;
      }
    }
  }

  bool isSolved() {
    final crossAxisCount = math.sqrt(tiles.length + 1).toInt();
    if (emptyPosition.x == crossAxisCount &&
        emptyPosition.y == crossAxisCount) {
      for (final tile in tiles) {
        if (tile.position != tile.correctPosition) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  @override
  List<Object> get props => [
        tiles,
        emptyPosition,
        image,
        segmentedImage,
      ];
}
