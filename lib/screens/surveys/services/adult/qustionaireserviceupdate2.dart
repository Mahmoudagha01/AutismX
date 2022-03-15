import 'dart:convert';

import 'package:autismx/screens/surveys/enums/questionairetypeupdate2.dart';
import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:flutter/services.dart' show rootBundle;



class QuestionnaireService {
  String getQuestionnaireAssetPath(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      
        
        case QuestionnaireType.AttentionToDetail:
        return 'assets/questionnaires/adult/Attention To Detail updated.json';
        case QuestionnaireType.Communication:
        return 'assets/questionnaires/adult/Communication.json';
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