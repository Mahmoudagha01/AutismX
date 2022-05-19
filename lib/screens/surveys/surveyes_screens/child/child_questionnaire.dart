import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/screens/surveys/models/answer.dart';
import 'package:autismx/screens/surveys/models/question.dart';
import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:autismx/screens/surveys/surveyes_screens/child/child_result.dart';


import 'package:autismx/screens/surveys/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ChildQuestionnaireScreen extends StatefulWidget {
  final Questionnaire questionnaire;
  final String name;
  final String age;
  final String gender;
  ChildQuestionnaireScreen(
      {@required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire});

  @override
  _ChildQuestionnaireScreenState createState() =>
      _ChildQuestionnaireScreenState();
}

class _ChildQuestionnaireScreenState extends State<ChildQuestionnaireScreen> {
  List<Question> get questions => widget.questionnaire.questions;
  bool get isActive => widget.questionnaire.isActive;
  int questionIndex;
  Question get currentQuestion => questions[questionIndex];
  int get numberOfQuestions => questions.length;
  List<int> chosenAnswers;
  bool get userHasAnsweredCurrentQuestion =>
      chosenAnswers[questionIndex] != null;
  String get instructions => widget.questionnaire.instructions;

  int getscore() {
    // calculate user's total score
    int result = 0;
    for (int index = 0; index < numberOfQuestions; index++) {
      Question question = questions[index];
      int answerIndex = chosenAnswers[index];
      Answer answer = question.answers[answerIndex];
      int score1 = answer.score;
      result += score1;
    }
    return result;
  }

  @override
  void initState() {
    super.initState();

    questionIndex = 0;
    // Uint8List
    chosenAnswers = List<int>(numberOfQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.questionnaire.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //   child: Text(
              //     instructions,
              //     textAlign: TextAlign.justify,
              //     style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.w500,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        bottom: 70,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: Image.asset("assets/images/Attention switchingopa.png")),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "${questionIndex + 1}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  TextSpan(
                                    text: "/${questions.length}",
                                    style: const TextStyle(
                                        fontSize: 25, color: Colors.black),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: FAProgressBar(
                                size: 15,
                                direction: Axis.horizontal,
                                maxValue: 100,
                                currentValue:
                                    (questionIndex * 100 / questions.length)
                                        .round(),
                                progressColor: Colors.blue,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 8.0),
                            child: Text(
                              currentQuestion.text,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: ColorManager.blueFont),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          RadioButtonGroup(
                            labelStyle: const TextStyle(fontSize: 20),
                            activeColor: Theme.of(context).primaryColor,
                            labels: currentQuestion.answers
                                .map((answer) => answer.text)
                                .toList(),
                            onChange: (_, answerIndex) => setState(() {
                              chosenAnswers[questionIndex] = answerIndex;
                            }),
                            picked: !userHasAnsweredCurrentQuestion
                                ? ""
                                : currentQuestion
                                    .answers[chosenAnswers[questionIndex]].text,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Visibility(
                                  visible: questionIndex != 0,
                                  child: Button.accent(
                                    buttonLabel: 'Back',
                                    onPressed: onBackButtonPressed,
                                  ),
                                ),
                                Button.primary(
                                  buttonLabel: 'Next',
                                  onPressed: userHasAnsweredCurrentQuestion
                                      ? onNextButtonPressed
                                      : null,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNextButtonPressed() {
    if (questionIndex < numberOfQuestions - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      setState(() {
        print(getscore());
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>ResultScreen(
         score: getscore(),
          
            name: widget.name,
            age: widget.age,
            gender: widget.gender,
            questionnaireName: widget.questionnaire.name,
          )),
      );

      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ResultScreen(
      //       questionnaireName: widget.questionnaire.name,
      //       interpretation: getResultInterpretation(),
      //     ),
      //   ),
      // );
    }
  }

  void onBackButtonPressed() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
      });
    }
  }
}

