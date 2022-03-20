import 'dart:typed_data';

abstract class ImagesRepository {
  /// segmentand image for a puzzle
  /// 
  /// [asset] the asset path
  /// 
  /// [crossAxisCount] number of columns and rows
  Future<List<Uint8List>> split(String asset, int crossAxisCount);
}
