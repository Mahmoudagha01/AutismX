class Board {
  String name;
  String author;
  String email;
  String format;
  List<Tiles> tiles;
  String caption;
  bool isPublic;
  String locale;

  Board(
      {this.name,this.author,this.email,this.format,
      this.tiles,this.caption,this.isPublic,this.locale});

  Board.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    author = json['author'];
    email = json['email'];
    format = json['format'];
    if (json['tiles'] != null) {
      tiles = <Tiles>[];
      json['tiles'].forEach((v) {
        tiles.add(Tiles.fromJson(v));
      });
    }
    caption = json['caption'];
    isPublic = json['isPublic'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['author'] = author;
    data['email'] = email;
    data['format'] = format;
    if (tiles != null) {
      data['tiles'] = tiles.map((v) => v.toJson()).toList();
    }
    data['caption'] = caption;
    data['isPublic'] = isPublic;
    data['locale'] = locale;
    return data;
  }
}

class Tiles {
  String labelKey;
  String image;
  String id;
  String backgroundColor;

  Tiles({this.labelKey, this.image, this.id, this.backgroundColor});

  Tiles.fromJson(Map<String, dynamic> json) {
    labelKey = json['labelKey'];
    image = json['image'];
    id = json['id'];
    backgroundColor = json['backgroundColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labelKey'] = labelKey;
    data['image'] = image;
    data['id'] = id;
    data['backgroundColor'] = backgroundColor;
    return data;
  }
}
