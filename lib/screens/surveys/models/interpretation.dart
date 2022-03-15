import 'package:meta/meta.dart';

class Interpretation {
  final int score;
  final String text;

  Interpretation({
    @required this.score,
    @required this.text,
  });

  factory Interpretation.fromJson(Map<String, dynamic> json) => Interpretation(
        score: json['score'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        'score': score,
        'text': text,
      };

  @override
  String toString() => toJson().toString();
}
