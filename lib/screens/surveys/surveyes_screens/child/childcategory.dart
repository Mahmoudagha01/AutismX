import 'package:autismx/screens/surveys/configs/colors.dart';

import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:autismx/screens/surveys/services/child/questionaire_service.dart';
import 'package:autismx/screens/surveys/surveyes_screens/child/child_questionnaire.dart';
import 'package:flutter/material.dart';

import '../../enums/qtype.dart';

class ChildCategory extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  const ChildCategory(
      {@required this.name, @required this.age, @required this.gender, Key key})
      : super(key: key);

  @override
  _ChildCategoryState createState() => _ChildCategoryState();
}

class _ChildCategoryState extends State<ChildCategory> {
  List<Questionnaire> questionnaires;
  int index;
  Future<bool> loadAllQuestionnairesFuture;

  @override
  void initState() {
    super.initState();

    loadAllQuestionnairesFuture = loadAllQuestionnaires();
  }

  Future<bool> loadAllQuestionnaires() async {
    final questionnaireService = QuestionnaireService();
    questionnaires = [];
    for (QuestionnaireType questionnaireType in QuestionnaireType.values) {
      final questionnaire =
          await questionnaireService.getQuestionnaire(questionnaireType);

      // if something went wrong, stop loading questionnaires
      if (questionnaire == null) {
        return false;
      }

      questionnaires.add(questionnaire);
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Questionnaires',
        ),
      ),
      body: FutureBuilder(
        future: loadAllQuestionnairesFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        for (Questionnaire questionnaire in questionnaires)
                          InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChildQuestionnaireScreen(
                                            name: widget.name,
                                            age: widget.age,
                                            gender: widget.gender,
                                            questionnaire: questionnaire,
                                          ),
                                        ),
                                      );
                                    
                              },
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 5,
                                      color: Colors.black.withOpacity(0.3),
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  questionnaire.image))),
                                    ),
                                    Text(
                                      questionnaire.name,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: ColorManager.greyFont),
                                    )
                                  ],
                                ),
                                // Center(
                                //     child: Text(
                                //   questionnaire.name,
                                //   style: const TextStyle(fontSize: 22),
                                // )),
                              ))
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError ||
              (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data == false)) {
            return AlertDialog(
              title: const Text('Ooops something went wrong!'),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Try Again'),
                  onPressed: () => setState(() {
                    loadAllQuestionnairesFuture = loadAllQuestionnaires();
                  }),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

