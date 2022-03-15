import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/screens/surveys/models/answer.dart';
import 'package:autismx/screens/surveys/models/question.dart';
import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:autismx/screens/surveys/surveyes_screens/children4/child4_result.dart';
import 'package:autismx/screens/surveys/surveyes_screens/children4/child4continue.dart';
import 'package:autismx/screens/surveys/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Child4QuestionnaireScreen extends StatefulWidget {
  final Questionnaire questionnaire;
  final String name;
  final String age;
  final String gender;
  Child4QuestionnaireScreen(
      {@required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire});

  @override
  _Child4QuestionnaireScreenState createState() =>
      _Child4QuestionnaireScreenState();
}

class _Child4QuestionnaireScreenState extends State<Child4QuestionnaireScreen> {
  List<Question> get questions => widget.questionnaire.questions;
  bool get isActive => widget.questionnaire.isActive;
  int questionIndex;
  Question get currentQuestion => questions[questionIndex];
  int get numberOfQuestions => questions.length;
  List<int> chosenAnswers;
  bool get userHasAnsweredCurrentQuestion =>
      chosenAnswers[questionIndex] != null;
  String get instructions => widget.questionnaire.instructions;

  int getscore1() {
    // calculate user's total score
    int result1 = 0;
    for (int index = 0; index < numberOfQuestions; index++) {
      Question question = questions[index];
      int answerIndex = chosenAnswers[index];
      Answer answer = question.answers[answerIndex];
      int score1 = answer.score;
      result1 += score1;
    }
    return result1;
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
                            child: Image.asset("assets/images/Socialopa.png")),
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
        print(getscore1());
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Continue(
                  score1: getscore1(),
                  questionnaire: widget.questionnaire,
                  name: widget.name,
                  age: widget.age,
                  gender: widget.gender,
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

//****************Questionnaire For AttentionSwithing***********************//

class Questionnaire1 extends StatefulWidget {
  final Questionnaire questionnaire;
  final int score1;
  final String name;
  final String age;
  final String gender;
  Questionnaire1(
      {@required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire,
      @required this.score1});

  @override
  _Questionnaire1State createState() => _Questionnaire1State();
}

class _Questionnaire1State extends State<Questionnaire1> {
  List<Question> get questions => widget.questionnaire.questions;
  bool get isActive => widget.questionnaire.isActive;
  int questionIndex;
  Question get currentQuestion => questions[questionIndex];
  int get numberOfQuestions => questions.length;
  List<int> chosenAnswers;
  bool get userHasAnsweredCurrentQuestion =>
      chosenAnswers[questionIndex] != null;
  String get instructions => widget.questionnaire.instructions;

  int getscore2() {
    // calculate user's total score
    int result2 = 0;
    for (int index = 0; index < numberOfQuestions; index++) {
      Question question = questions[index];
      int answerIndex = chosenAnswers[index];
      Answer answer = question.answers[answerIndex];
      int score2 = answer.score;

      result2 += score2;
    }
    return result2;
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
              //       color: Theme.of(context).accentColor,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      bottom: 70,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Image.asset(
                              "assets/images/Attention switchingopa.png")),
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
                  ]),
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
        print(getscore2());
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Continue1(
                  score1: widget.score1,
                  score2: getscore2(),
                  name: widget.name,
                  age: widget.age,
                  gender: widget.gender,
                  questionnaire: widget.questionnaire,
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

//****************Questionnaire For AttentionToDetail***********************//

class Questionnaire2 extends StatefulWidget {
  final Questionnaire questionnaire;
  final int score1;
  final int score2;
  final String name;
  final String age;
  final String gender;
  Questionnaire2(
      {@required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire,
      @required this.score1,
      @required this.score2});

  @override
  _Questionnaire2State createState() => _Questionnaire2State();
}

class _Questionnaire2State extends State<Questionnaire2> {
  List<Question> get questions => widget.questionnaire.questions;
  bool get isActive => widget.questionnaire.isActive;
  int questionIndex;
  Question get currentQuestion => questions[questionIndex];
  int get numberOfQuestions => questions.length;
  List<int> chosenAnswers;
  bool get userHasAnsweredCurrentQuestion =>
      chosenAnswers[questionIndex] != null;
  String get instructions => widget.questionnaire.instructions;

  int getscore3() {
    // calculate user's total score
    int result3 = 0;
    for (int index = 0; index < numberOfQuestions; index++) {
      Question question = questions[index];
      int answerIndex = chosenAnswers[index];
      Answer answer = question.answers[answerIndex];
      int score3 = answer.score;

      result3 += score3;
    }
    return result3;
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
              //       color: Theme.of(context).accentColor,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      bottom: 70,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Image.asset(
                              "assets/images/Attention to detailsopa.png")),
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
                  ]),
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
        print(getscore3());
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Continue2(
                  score1: widget.score1,
                  score2: widget.score2,
                  score3: getscore3(),
                  name: widget.name,
                  age: widget.age,
                  gender: widget.gender,
                  questionnaire: widget.questionnaire,
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

//****************Questionnaire For Communication***********************//

class Questionnaire3 extends StatefulWidget {
  final Questionnaire questionnaire;
  final int score1;
  final int score2;
  final int score3;
  final String name;
  final String age;
  final String gender;
  Questionnaire3(
      {@required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire,
      @required this.score1,
      @required this.score2,
      @required this.score3});

  @override
  _Questionnaire3State createState() => _Questionnaire3State();
}

class _Questionnaire3State extends State<Questionnaire3> {
  List<Question> get questions => widget.questionnaire.questions;
  bool get isActive => widget.questionnaire.isActive;
  int questionIndex;
  Question get currentQuestion => questions[questionIndex];
  int get numberOfQuestions => questions.length;
  List<int> chosenAnswers;
  bool get userHasAnsweredCurrentQuestion =>
      chosenAnswers[questionIndex] != null;
  String get instructions => widget.questionnaire.instructions;

  int getscore4() {
    // calculate user's total score
    int result4 = 0;
    for (int index = 0; index < numberOfQuestions; index++) {
      Question question = questions[index];
      int answerIndex = chosenAnswers[index];
      Answer answer = question.answers[answerIndex];
      int score4 = answer.score;

      result4 += score4;
    }
    return result4;
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
              //       color: Theme.of(context).accentColor,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      bottom: 70,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Image.asset(
                              "assets/images/Communicationopa.png")),
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
                  ]),
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
        print(getscore4());
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Continue3(
                  score1: widget.score1,
                  score2: widget.score2,
                  score3: widget.score3,
                  score4: getscore4(),
                  name: widget.name,
                  age: widget.age,
                  gender: widget.gender,
                  questionnaire: widget.questionnaire,
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

//****************Questionnaire For Imagination***********************//

class Questionnaire4 extends StatefulWidget {
  final Questionnaire questionnaire;
  final int score1;
  final int score2;
  final int score3;
  final int score4;
  final String name;
  final String age;
  final String gender;
  Questionnaire4(
      {@required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire,
      @required this.score1,
      @required this.score2,
      @required this.score3,
      @required this.score4});

  @override
  _Questionnaire4State createState() => _Questionnaire4State();
}

class _Questionnaire4State extends State<Questionnaire4> {
  List<Question> get questions => widget.questionnaire.questions;
  bool get isActive => widget.questionnaire.isActive;
  int questionIndex;
  Question get currentQuestion => questions[questionIndex];
  int get numberOfQuestions => questions.length;
  List<int> chosenAnswers;
  bool get userHasAnsweredCurrentQuestion =>
      chosenAnswers[questionIndex] != null;
  String get instructions => widget.questionnaire.instructions;

  int getscore5() {
    // calculate user's total score
    int result5 = 0;
    for (int index = 0; index < numberOfQuestions; index++) {
      Question question = questions[index];
      int answerIndex = chosenAnswers[index];
      Answer answer = question.answers[answerIndex];
      int score5 = answer.score;

      result5 += score5;
    }
    return result5;
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
              //       color: Theme.of(context).accentColor,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Stack(children: [
                    Positioned(
                      left: 0,
                      bottom: 70,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          child:
                              Image.asset("assets/images/Imaginationopa.png")),
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
                  ]),
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
        print(getscore5());
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score1: widget.score1,
            score2: widget.score2,
            score3: widget.score3,
            score4: widget.score4,
            score5: getscore5(),
            name: widget.name,
            age: widget.age,
            gender: widget.gender,
            questionnaireName: widget.questionnaire.name,
          ),
        ),
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
