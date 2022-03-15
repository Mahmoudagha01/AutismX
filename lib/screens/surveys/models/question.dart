

import 'package:autismx/screens/surveys/models/answer.dart';
import 'package:meta/meta.dart';


class Question {
  final String text;
  final List<Answer> answers;

  Question({
    @required this.text,
    @required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        text: json['text'],
        answers: List<Answer>.from(json['answers'].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'answers': List<dynamic>.from(answers.map((x) => x.toJson())),
      };

  @override
  String toString() => toJson().toString();
}
