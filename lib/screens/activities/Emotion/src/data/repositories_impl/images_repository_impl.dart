import 'dart:typed_data';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';

import '../../domain/models/Emotion_image.dart';
import '../../domain/repositories/images_repository.dart';


  List<EmotionImage> puzzleOptions = <EmotionImage>[
  const EmotionImage(
    name: 'Start',
    assetPath: 'assets/images/start.png',
    soundPath: 'assets/sounds/start.mp3', gifPath: 'assets/images/start1.gif',
  ),
  const EmotionImage(
    name: 'Happy',
    assetPath: 'assets/images/Happy.png',
    soundPath: 'assets/sounds/happy.mp3', gifPath: 'assets/images/happy.gif',
  ),
    const EmotionImage(
    name: 'Sad',
    assetPath: 'assets/images/Sad.png',
    soundPath: 'assets/sounds/sad.mp3', gifPath: 'assets/images/Sad_2.gif',
  ),
  const EmotionImage(
    name: 'Angry',
    assetPath: 'assets/images/Angry.png',
    soundPath: 'assets/sounds/Angry.mp3', gifPath: 'assets/images/Angry2.gif',
  ),
const EmotionImage(
    name: 'Cry',
    assetPath: 'assets/images/Cry.png',
    soundPath: 'assets/sounds/crying.mp3', gifPath: 'assets/images/Cry_1.gif',
  ),
   const EmotionImage(
    name: 'Surprised',
    assetPath: 'assets/images/Surprised.png',
    soundPath: 'assets/sounds/surprised.mp3', gifPath: 'assets/images/Surprised.gif',
  ),
  const EmotionImage(
    name: 'Funny',
    assetPath: 'assets/images/Funny.png',
    soundPath: 'assets/sounds/funny.mp3', gifPath: 'assets/images/Funny_1.gif',
  ),
  const EmotionImage(
    name: 'Calm',
    assetPath: 'assets/images/Calim.png',
    soundPath: 'assets/sounds/calm.mp3', gifPath: 'assets/images/Calim.gif',
  ),

  const EmotionImage(
    name: 'Frighten',
    assetPath: 'assets/images/Frighten.png',
    soundPath: 'assets/sounds/frightened.mp3', gifPath: 'assets/images/Frighten.gif',
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