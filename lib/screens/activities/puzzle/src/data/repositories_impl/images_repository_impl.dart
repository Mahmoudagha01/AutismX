import 'dart:typed_data';
import 'dart:math' as math;

import 'package:autismx/screens/activities/puzzle/src/domain/models/puzzle_image.dart';
import 'package:autismx/screens/activities/puzzle/src/domain/repositories/images_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';


const puzzleOptions = <PuzzleImage>[
  PuzzleImage(
    name: 'Numeric',
    assetPath: 'assets/images/numeric-puzzle.png',
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Lion',
    assetPath: 'assets/animals/lion.png',
    soundPath: 'assets/sounds/lion.mp3',
  ),
  PuzzleImage(
    name: 'Cat',
    assetPath: 'assets/animals/cat.png',
    soundPath: 'assets/sounds/cat.mp3',
  ),
  PuzzleImage(
    name: 'Dog',
    assetPath: 'assets/animals/dog.png',
    soundPath: 'assets/sounds/dog.mp3',
  ),
  PuzzleImage(
    name: 'Fox',
    assetPath: 'assets/animals/fox.png',
    soundPath: 'assets/sounds/fox.mp3',
  ),
  PuzzleImage(
    name: 'Koala',
    assetPath: 'assets/animals/koala.png',
    soundPath: 'assets/sounds/koala.mp3',
  ),
  PuzzleImage(
    name: 'Monkey',
    assetPath: 'assets/animals/monkey.png',
    soundPath: 'assets/sounds/monkey.mp3',
  ),
  PuzzleImage(
    name: 'Mouse',
    assetPath: 'assets/animals/mouse.png',
    soundPath: 'assets/sounds/mouse.mp3',
  ),
  PuzzleImage(
    name: 'Panda',
    assetPath: 'assets/animals/panda.png',
    soundPath: 'assets/sounds/panda.mp3',
  ),
  PuzzleImage(
    name: 'Penguin',
    assetPath: 'assets/animals/penguin.png',
    soundPath: 'assets/sounds/penguin.mp3',
  ),
  PuzzleImage(
    name: 'Tiger',
    assetPath: 'assets/animals/tiger.png',
    soundPath: 'assets/sounds/tiger.mp3',
  ),
];

Future<Image> decodeAsset(ByteData bytes) async {
  return decodeImage(
    bytes.buffer.asUint8List(),
  );
}

class SPlitData {
  final Image image;
  final int crossAxisCount;

  SPlitData(this.image, this.crossAxisCount);
}

Future<List<Uint8List>> splitImage(SPlitData data) {
  final image = data.image;
  final crossAxisCount = data.crossAxisCount;
  final int length = (image.width / crossAxisCount).round();
  List<Uint8List> pieceList = [];

  for (int y = 0; y < crossAxisCount; y++) {
    for (int x = 0; x < crossAxisCount; x++) {
      pieceList.add(
        Uint8List.fromList(
          encodePng(
            copyCrop(
              image,
              x * length,
              y * length,
              length,
              length,
            ),
          ),
        ),
      );
    }
  }
  return Future.value(pieceList);
}

class ImagesRepositoryImpl implements ImagesRepository {
  Map<String, Image> cache = {};

  @override
  Future<List<Uint8List>> split(String asset, int crossAxisCount) async {
     Image image;
    if (cache.containsKey(asset)) {
      image = cache[asset];
    } else {
      final bytes = await rootBundle.load(asset);

      /// use compute because theimage package is a pure dart package
      /// so to avoid bad ui performance we do this task in a different
      /// isolate
      image = await compute(decodeAsset, bytes);

      final width = math.min(image.width, image.height);

      /// convert to square
      image = copyResizeCropSquare(image, width);
      cache[asset] = image;
    }

    final pieces = await compute(
      splitImage,
      SPlitData(image, crossAxisCount),
    );

    return pieces;
  }
}
