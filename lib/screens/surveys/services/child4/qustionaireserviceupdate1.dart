import 'dart:convert';

import 'package:autismx/screens/surveys/enums/questionairetypeupdate1.dart';
import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:flutter/services.dart' show rootBundle;



class QuestionnaireService {
  String getQuestionnaireAssetPath(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      
        case QuestionnaireType.AttentionSwithing:
        return 'assets/questionnaires/children4/Attention Switching updated.json';
        case QuestionnaireType.AttentionToDetail:
        return 'assets/questionnaires/children4/Attention To Detail.json';
        case QuestionnaireType.Communication:
        return 'assets/questionnaires/children4/Communication.json';
        case QuestionnaireType.Imagination:
        return 'assets/questionnaires/children4/Imagination.json';
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