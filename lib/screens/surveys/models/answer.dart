import 'package:meta/meta.dart';

class Answer {
  final int score;
  final String text;

  Answer({
    @required this.score,
    @required this.text,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
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
