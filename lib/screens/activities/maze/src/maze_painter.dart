import 'dart:developer';
import 'dart:math';
import 'dart:ui' as ui;


import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart' hide Stack;

import 'models/cell.dart';
import 'models/item_position.dart';
import 'models/stack.dart';
// Direction movement
enum Direction {
  ///Goes up in the maze
  up,

  ///Goes down in the maze
  down,

  ///Goes left in the maze
  left,

  ///Goes right in the maze
  right
}

///Maze Painter
///
///Draws the maze based on params
class MazePainter extends ChangeNotifier implements CustomPainter {

  ///Default constructor
  MazePainter({
    @required this.playerImage,
    this.checkpointsImages = const [],
    this.columns = 7,
    this.finishImage,
    this.onCheckpoint,
    this.celebrate,
    this.onFinish,
    this.rows = 10,
    this.wallColor = Colors.blue,
    this.wallThickness = 4.0,
    
  }) {
    _wallPaint
      ..color = wallColor
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = wallThickness;

    _exitPaint.color = wallColor;

    _checkpoints = List.from(checkpointsImages);
    _checkpointsPositions = _checkpoints
        .map((i) => ItemPosition(
            col: _randomizer.nextInt(columns), row: _randomizer.nextInt(rows)))
        .toList();

    _createMaze();
  }

  ///Images for checkpoints
  final List<ui.Image> checkpointsImages;
var player = AudioCache();
  ///Number of collums
  final int columns;

  ///Image for player
  final ui.Image finishImage;

  ///Callback when the player reach a checkpoint
  final Function(int) onCheckpoint;

  ///Callback when the player reach the finish
  final Function onFinish;
final Function celebrate;
  ///Image for player
   ui.Image playerImage;

  ///Number of rows
  final int rows;
static int count=0;
  ///Color of the walls
  Color wallColor;

  ///Size of the walls
  final double wallThickness;

  ///Private attributes
   Cell _player, _exit;
 List<ItemPosition> _checkpointsPositions;
   List<List<Cell>> _cells;
  List<ui.Image> _checkpoints;
   double _cellSize, _hMargin, _vMargin;

  ///Paints for `exit`, `player` and `walls`
  final Paint _exitPaint = Paint();
  final Paint _playerPaint = Paint();
  final Paint _wallPaint = Paint();

  ///Randomizer for positions and walls distribution
  final Random _randomizer = Random();

  ///Position of user from event
  double _userX;
  double _userY;
  
static int getScore(){
  
return count++;

}
  ///This method initialize the maze by randomizing what wall will be disable
  void _createMaze() {
    var stack = Stack<Cell>();
    Cell current;
    Cell next;
count=0;
    _cells =
        List.generate(columns, (c) => List.generate(rows, (r) => Cell(c, r)));

    _player = _cells.first.first;
    _exit = _cells.last.last;

    current = _cells.first.first..visited = true;

    do {
      next = _getNext(current);
      if (next != null) {
        _removeWall(current, next);
        stack.push(current);
        current = next..visited = true;
      } else {
        current = stack.pop();
      }
    } while (stack.isNotEmpty);
  }

  @override
  bool hitTest(Offset position) {
    return true;
  }

  /// This method moves player to user input
  void movePlayer(Direction direction) {
    switch (direction) {
      case Direction.up:
        {
          if (!_player.topWall) _player = _cells[_player.col][_player.row - 1];
          break;
        }
      case Direction.down:
        {
          if (!_player.bottomWall) {
            _player = _cells[_player.col][_player.row + 1];
          }
          break;
        }
      case Direction.left:
        {
          if (!_player.leftWall) _player = _cells[_player.col - 1][_player.row];
          break;
        }
      case Direction.right:
        {
          if (!_player.rightWall) {
            _player = _cells[_player.col + 1][_player.row];
          }
          break;
        }
    }

    final result = _getItemPosition(_player.col, _player.row);

    if (result != null) {
      final checkpointIndex = _checkpointsPositions.indexOf(result);
      final image = _checkpoints[checkpointIndex];
      _checkpoints.remove(image);
      //print("object");
getScore();
player.play("coin.wav");
      _checkpointsPositions.removeAt(checkpointIndex);
      if (onCheckpoint != null) {
        onCheckpoint(checkpointsImages.indexOf(image));
      }
    }

    if (_player.col == _exit.col && _player.row == _exit.row) {
      if (onFinish != null) {
        onFinish();
        celebrate();
         player.play('success.wav');
        playerImage.dispose();
      
       
      }
    }
  }

  ///This method is used to notify the user drag position change to the maze
  ///and perfom the movement
  void updatePosition(Offset position) {
    _userX = position.dx;
    _userY = position.dy;
    notifyListeners();

    var playerCenterX = _hMargin + (_player.col + 0.5) * _cellSize;
    var playerCenterY = _vMargin + (_player.row + 0.5) * _cellSize;

    var dx = _userX - playerCenterX;
    var dy = _userY - playerCenterY;

    var absDx = dx.abs();
    var absDy = dy.abs();

    if (absDx > _cellSize || absDy > _cellSize) {
      if (absDx > absDy) {
        // X
        if (dx > 0) {
          movePlayer(Direction.right);
        } else {
          movePlayer(Direction.left);
        }
      } else {
        // Y
        if (dy > 0) {
          movePlayer(Direction.down);
        } else {
          movePlayer(Direction.up);
        }
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width / size.height < columns / rows) {
      _cellSize = size.width / (columns + 1);
    } else {
      _cellSize = size.height / (rows + 1);
    }

    _hMargin = (size.width - columns * _cellSize) / 2;
    _vMargin = (size.height - rows * _cellSize) / 2;

    var squareMargin = _cellSize / 10;

    canvas.translate(_hMargin, _vMargin);

    for (var v in _cells) {
      for (var cell in v) {
        if (cell.topWall) {
          canvas.drawLine(
              Offset(cell.col * _cellSize, cell.row * _cellSize),
              Offset((cell.col + 1) * _cellSize, cell.row * _cellSize),
              _wallPaint);
        }

        if (cell.leftWall) {
          canvas.drawLine(
              Offset(cell.col * _cellSize, cell.row * _cellSize),
              Offset(cell.col * _cellSize, (cell.row + 1) * _cellSize),
              _wallPaint);
        }

        if (cell.bottomWall) {
          canvas.drawLine(
              Offset(cell.col * _cellSize, (cell.row + 1) * _cellSize),
              Offset((cell.col + 1) * _cellSize, (cell.row + 1) * _cellSize),
              _wallPaint);
        }

        if (cell.rightWall) {
          canvas.drawLine(
              Offset((cell.col + 1) * _cellSize, cell.row * _cellSize),
              Offset((cell.col + 1) * _cellSize, (cell.row + 1) * _cellSize),
              _wallPaint);
        }
      }
    }

    if (finishImage != null) {
      canvas.drawImageRect(
          finishImage,
          Offset.zero &
              Size(finishImage.width.toDouble(),
                  finishImage.height.toDouble()),
          Offset(_exit.col * _cellSize + squareMargin,
                  _exit.row * _cellSize + squareMargin) &
              Size(_cellSize - squareMargin, _cellSize - squareMargin),
          _exitPaint);
    } else {
      canvas.drawRect(
          Rect.fromPoints(
              Offset(_exit.col * _cellSize + squareMargin,
                  _exit.row * _cellSize + squareMargin),
              Offset((_exit.col + 1) * _cellSize - squareMargin,
                  (_exit.row + 1) * _cellSize - squareMargin)),
          _exitPaint);
    }

    for (var i = 0; i < _checkpoints.length; i++) {
      canvas.drawImageRect(
          _checkpoints[i],
          Offset.zero &
              Size(_checkpoints[i].width.toDouble(),
                  _checkpoints[i].height.toDouble()),
          Offset(_checkpointsPositions[i].col * _cellSize + squareMargin,
                  _checkpointsPositions[i].row * _cellSize + squareMargin) &
              Size(_cellSize - squareMargin, _cellSize - squareMargin),
          Paint());
    }

    canvas.drawImageRect(
        playerImage,
        Offset.zero &
            Size(playerImage.width.toDouble(), playerImage.height.toDouble()),
        Offset(_player.col * _cellSize + squareMargin,
                _player.row * _cellSize + squareMargin) &
            Size(_cellSize - squareMargin, _cellSize - squareMargin),
        _playerPaint);
  }

  @override
  List<CustomPainterSemantics> Function(Size) get semanticsBuilder => null;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Cell _getNext(Cell cell) {
    var neighbours = <Cell>[];

    //left
    if (cell.col > 0) {
      if (!_cells[cell.col - 1][cell.row].visited) {
        neighbours.add(_cells[cell.col - 1][cell.row]);
      }
    }

    //right
    if (cell.col < columns - 1) {
      if (!_cells[cell.col + 1][cell.row].visited) {
        neighbours.add(_cells[cell.col + 1][cell.row]);
      }
    }

    //Top
    if (cell.row > 0) {
      if (!_cells[cell.col][cell.row - 1].visited) {
        neighbours.add(_cells[cell.col][cell.row - 1]);
      }
    }

    //Bottom
    if (cell.row < rows - 1) {
      if (!_cells[cell.col][cell.row + 1].visited) {
        neighbours.add(_cells[cell.col][cell.row + 1]);
      }
    }
    if (neighbours.isNotEmpty) {
      final index = _randomizer.nextInt(neighbours.length);
      return neighbours[index];
    }
    return null;
  }

  void _removeWall(Cell current, Cell next) {
    //Below
    if (current.col == next.col && current.row == next.row + 1) {
      current.topWall = false;
      next.bottomWall = false;
    }

    //Above
    if (current.col == next.col && current.row == next.row - 1) {
      current.bottomWall = false;
      next.topWall = false;
    }

    //right
    if (current.col == next.col + 1 && current.row == next.row) {
      current.leftWall = false;
      next.rightWall = false;
    }

    //left
    if (current.col == next.col - 1 && current.row == next.row) {
      current.rightWall = false;
      next.leftWall = false;
    }
  }

  ItemPosition _getItemPosition(int col, int row) {
    try {
      return _checkpointsPositions.singleWhere(
          (element) => element == ItemPosition(col: col, row: row));
    } catch (e) {
      return null;
    }
  }
}
