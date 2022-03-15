import 'package:autismx/screens/surveys/enums/questionnaire_type.dart';
import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:autismx/screens/surveys/services/adult/questionnaire_service.dart';
import 'package:autismx/screens/surveys/surveyes_screens/adult/questionnaire_screen.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AdultSocialSkills extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  const AdultSocialSkills({
    Key key,
    @required this.name,
    @required this.age,
    @required this.gender,
  }) : super(key: key);

  @override
  _AdultSocialSkillsState createState() => _AdultSocialSkillsState();
}

class _AdultSocialSkillsState extends State<AdultSocialSkills> {
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
      // appBar: AppBar(
      //   backgroundColor: ColorManager.blue,
      //   automaticallyImplyLeading: false,
      //   title: const Text(
      //     'Questionnaires',
      //   ),
      // ),
      body: FutureBuilder(
        future: loadAllQuestionnairesFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return Column(
              children: <Widget>[
                SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 20,
                        color: const Color.fromRGBO(236, 240, 243, 1),
                      ),
                      Positioned(
                          child: SvgPicture.asset("assets/images/Path1.svg")),
                      Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width * 0.32,
                        child: Container(
                            width: 140,
                            height: 100,
                            child: Image.asset("assets/images/header.png")),
                      ),
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back,color: ColorManager.blue,))
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    children: [
                      for (Questionnaire questionnaire in questionnaires)
                        InkWell(
                            onTap: () {
                              questionnaire.isActive
                                  ? Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            QuestionnaireScreen(
                                          name: widget.name,
                                          age: widget.age,
                                          gender: widget.gender,
                                          questionnaire: questionnaire,
                                        ),
                                      ),
                                    )
                                  : _showDialog(context);
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
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
