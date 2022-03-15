import 'package:autismx/screens/surveys/models/question.dart';
import 'package:meta/meta.dart';



class Questionnaire {
  final String name;
  final String image;
  final String instructions;
  final List<Question> questions;
  //final List<Interpretation> interpretations;
   bool isActive;

  Questionnaire({
    @required this.name,
    @required this.image,
    @required this.instructions,
    @required this.questions,
    //@required this.interpretations,
    @required this.isActive,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
        name: json['name'],
        image: json['image'],
        isActive: json['isActive'],
        instructions: json['instructions'],
        questions: List<Question>.from(json['questions'].map((x) => Question.fromJson(x))),
        //interpretations: List<Interpretation>.from(json['interpretations'].map((x) => Interpretation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'image':image,
        'isActve':isActive,
        'instructions': instructions,
        'questions': List<dynamic>.from(questions.map((x) => x.toJson())),
        //'interpretations': List<dynamic>.from(interpretations.map((x) => x.toJson())),
      };

  @override
  String toString() => toJson().toString();
}
