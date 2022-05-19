///Image Type
///
///Tells what kind of image is
enum ImageType {
  ///Image from asset
  asset,

  ///Image from file
  file,

  ///Image from internet
  network
}

///Maze Item
///
///Handle info for image and its type
class MazeItem {
  ///Default constructor
  MazeItem(this.path, this.type);

  ///Image type
  ImageType type;

  ///Image path
  String path;
}
