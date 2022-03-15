import 'dart:convert';
import 'package:autismx/screens/surveys/enums/questionairetypeupdate3.dart';
import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:flutter/services.dart' show rootBundle;




class QuestionnaireService {
  String getQuestionnaireAssetPath(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      
        case QuestionnaireType.Communication:
        return 'assets/questionnaires/adult/Communication updated.json';
        case QuestionnaireType.Imagination:
        return 'assets/questionnaires/adult/Imagination.json';
      default:
        return null;
    }
  }
   Future<Questionnaire> getQuestionnaire(QuestionnaireType questionnaireType) async {
    final assetPath = getQuestionnaireAssetPath(questionnaireType);
    final jsonData = await rootBundle.loadString(assetPath);
    final jsonDataDecoded = jsonDecode(jsonData);
    return Questionnaire.fromJson(jsonDataDecoded);
  }
}