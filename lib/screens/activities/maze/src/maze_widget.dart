import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'maze_painter.dart';
import 'models/item.dart';

///Maze
///
///Create a simple but powerfull maze game
///You can customize [wallColor], [wallThickness],
///[columns] and [rows]. A [player] is required and also
///you can pass a List of [checkpoints] and you will be notified
///if the player pass through a checkout at [onCheckpoint]
class Maze extends StatefulWidget {
  ///Default constructor
  Maze({
    @required this.player,
    this.checkpoints = const [],
    this.columns = 10,
    this.finish,
    this.height,
    this.loadingWidget,
    this.onCheckpoint,
    this.onFinish,
    this.celebrate,
    this.rows = 7,
    this.wallColor = Colors.blue,
    this.wallThickness = 3.0,
    this.width,
    this.getScore
  });

  ///List of checkpoints
  final List<MazeItem> checkpoints;

  ///Columns of the maze
  final int columns;

  ///The finish image
  final MazeItem finish;

  ///Height of the maze
  final double height;

  ///A widget to show while loading all
  final Widget loadingWidget;

  ///Callback when the player pass through a checkpoint
  final Function(int) onCheckpoint;

  ///Callback when the player reach finish
  final Function() onFinish;
  final Function() celebrate;
  final Function() getScore;
  ///The main player
  final MazeItem player;

  ///Rows of the maze
  final int rows;

  ///Wall color
  final Color wallColor;

  ///Wall thickness
  ///
  ///Default: 3.0
  final double wallThickness;

  ///Width of the maze
  final double width;

  @override
  _MazeState createState() => _MazeState();
}

class _MazeState extends State<Maze> {
  bool _loaded = false;
  MazePainter _mazePainter;

  @override
  void initState() {
    super.initState();
    setUp();
  }

  void setUp() async {
    final playerImage = await _itemToImage(widget.player);
    final checkpoints = await Future.wait(
        widget.checkpoints.map((c) async => await _itemToImage(c)));
    final finishImage =
        widget.finish != null ? await _itemToImage(widget.finish) : null;

    _mazePainter = MazePainter(
      checkpointsImages: checkpoints,
      columns: widget.columns,
      finishImage: finishImage,
      onCheckpoint: widget.onCheckpoint,
      onFinish: widget.onFinish,
      celebrate: widget.celebrate,
    
      playerImage: playerImage,
      rows: widget.rows,
      wallColor: widget.wallColor ?? Colors.blue,
      wallThickness: widget.wallThickness ?? 4.0,
    );
    setState(() => _loaded = true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Builder(builder: (context) {
      if (_loaded) {
        return GestureDetector(
            onVerticalDragUpdate: (info) =>
                _mazePainter.updatePosition(info.localPosition),
            child: CustomPaint(
                painter: _mazePainter,
                size: Size(  context.width,
                    context.height)));
      } else {
        if (widget.loadingWidget != null) {
          return widget.loadingWidget;
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    }));
  }

  Future<ui.Image> _itemToImage(MazeItem item) {
    switch (item.type) {
      case ImageType.file:
        return _fileToByte(item.path);
      case ImageType.network:
        return _networkToByte(item.path);
      default:
        return _assetToByte(item.path);
    }
  }

  ///Creates a Image from file
  Future<ui.Image> _fileToByte(String path) async {
    final completer = Completer<ui.Image>();
    final bytes = await File(path).readAsBytes();
    ui.decodeImageFromList(bytes, completer.complete);
    return completer.future;
  }

  ///Creates a Image from asset
  Future<ui.Image> _assetToByte(String asset) async {
    final completer = Completer<ui.Image>();
    final bytes = await rootBundle.load(asset);
    ui.decodeImageFromList(bytes.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  ///Creates a Image from network
  Future<ui.Image> _networkToByte(String url) async {
    final completer = Completer<ui.Image>();
    final response = await http.get(Uri.parse(url));
    ui.decodeImageFromList(
        response.bodyBytes.buffer.asUint8List(), completer.complete);
    return completer.future;
  }
}

//Extension to get screen size
extension ScreenSizeExtension on BuildContext {
  //Gets the current height
  double get height => MediaQuery.of(this).size.height;

  //Gets the current width
  double get width => MediaQuery.of(this).size.width;
}
