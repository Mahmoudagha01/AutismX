import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/screens/surveys/enums/questionairetypeupdate4.dart';
import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:autismx/screens/surveys/services/child4/questionaireserviceupdate4.dart';
import 'package:autismx/screens/surveys/surveyes_screens/children4/child4_questionnaire.dart';
import 'package:flutter/material.dart';


class Child4Imagination extends StatefulWidget {
  final int score1;
  final int score2;
  final int score3;
  final int score4;
  final String name;
  final String age;
  final String gender;
  const Child4Imagination(
      {@required this.name,
      @required this.age,
      @required this.gender,
      Key key,
      this.score1,
      this.score2,
      this.score3,
      this.score4})
      : super(key: key);

  @override
  _Child4ImaginationState createState() => _Child4ImaginationState();
}

class _Child4ImaginationState extends State<Child4Imagination> {
  List<Questionnaire> questionnaires;
  int index;
  Future<bool> loadAllQuestionnairesFuture;
  Questionnaire questionnaire;
  @override
  void initState() {
    super.initState();

    loadAllQuestionnairesFuture = loadAllQuestionnaires();
  }

  Future<bool> loadAllQuestionnaires() async {
    final questionnaireService = QuestionnaireService();
    questionnaires = [];
    for (QuestionnaireType questionnaireType in QuestionnaireType.values) {
      questionnaire =
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
       backgroundColor:Colors.white,
      appBar: AppBar(
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
                                questionnaire.isActive
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => Questionnaire4(
                                            score1: widget.score1,
                                            score2: widget.score2,
                                            score3: widget.score3,
                                            score4: widget.score4,
                                            name: widget.name,
                                            age: widget.age,
                                            gender: widget.gender,
                                            questionnaire: questionnaire,
                                          ),
                                        ),
                                      )
                                    : _showDialog(context);
                              },
                              child:Container(
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
                                    style: const TextStyle(fontSize: 17,color: ColorManager.greyFont),
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

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        //title: new Text("Alert!"),
        content: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Please Perform Previous Section",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
           TextButton(
            child:  const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
