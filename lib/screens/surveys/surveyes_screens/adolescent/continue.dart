import 'package:autismx/screens/surveys/models/questionnaire.dart';
import 'package:autismx/screens/surveys/surveyes_screens/adolescent/adolecentattentionswithing.dart';
import 'package:autismx/screens/surveys/surveyes_screens/adolescent/adolecentattentiontodetail.dart';
import 'package:autismx/screens/surveys/surveyes_screens/adolescent/adolescentcommunication.dart';
import 'package:autismx/screens/surveys/surveyes_screens/adolescent/adolescentimagination.dart';
import 'package:flutter/material.dart';


class Continue extends StatefulWidget {
  final int score1;
  final String name;
  final String age;
  final String gender;
  final Questionnaire questionnaire;

  Continue(
      {this.score1,
      @required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire});

  @override
  _ContinueState createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Amazing!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "You 've done 10 of 50 questions !",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Now proceed to the next section.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Text(
              //   "${widget.score1}",
              //   style: TextStyle(fontSize: 25),
              // ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.questionnaire.isActive = false;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AdolescentAttentionSwith(
                      score1: widget.score1,
                      name: widget.name,
                      age: widget.age,
                      gender: widget.gender,
                    );
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Ok , Keep Going".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

//*********************Continue 2**************************//

class Continue1 extends StatefulWidget {
  final int score1;
  final int score2;
  final String name;
  final String age;
  final String gender;
  final Questionnaire questionnaire;

  Continue1(
      {this.score1,
      this.score2,
      @required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire});
  @override
  _Continue1State createState() => _Continue1State();
}

class _Continue1State extends State<Continue1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Amazing!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "You 've done 20 of 50 questions !",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Now proceed to the next section.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Text(
              //   "${widget.score2}",
              //   style: TextStyle(fontSize: 25),
              // ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.questionnaire.isActive = false;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AdolescentAttentionToDetail(
                      score1: widget.score1,
                      score2: widget.score2,
                        name: widget.name,
                      age: widget.age,
                      gender: widget.gender,
                    );
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Ok , Keep Going".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

//*********************Continue 3**************************//

class Continue2 extends StatefulWidget {
  final int score1;
  final int score2;
  final int score3;
  final String name;
  final String age;
  final String gender;
  final Questionnaire questionnaire;

  Continue2(
      {this.score1, this.score2,@required this.name,
    @required this.age,
    @required this.gender, this.score3, @required this.questionnaire});
  @override
  _Continue2State createState() => _Continue2State();
}

class _Continue2State extends State<Continue2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Amazing!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "You 've done 30 of 50 questions !",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Now proceed to the next section.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Text(
              //   "${widget.score3}",
              //   style: TextStyle(fontSize: 25),
              // ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.questionnaire.isActive = false;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AdolescentCommunication(
                      score1: widget.score1,
                      score2: widget.score2,
                      score3: widget.score3,
                        name: widget.name,
                      age: widget.age,
                      gender: widget.gender,
                    );
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Ok , Keep Going".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

//*********************Continue 4**************************//

class Continue3 extends StatefulWidget {
  final int score1;
  final int score2;
  final int score3;
  final int score4;
    final String name;
  final String age;
  final String gender;
  final Questionnaire questionnaire;

  Continue3(
      {this.score1,
      this.score2,
      this.score3,
      this.score4,
       @required this.name,
      @required this.age,
      @required this.gender,
      @required this.questionnaire});
  @override
  _Continue3State createState() => _Continue3State();
}

class _Continue3State extends State<Continue3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Amazing!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "You 've done 40 of 50 questions !",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                "Now proceed to the next section.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              // Text(
              //   "${widget.score4}",
              //   style: TextStyle(fontSize: 25),
              // ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.questionnaire.isActive = false;
                  });
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return AdolescentImagination(
                      score1: widget.score1,
                      score2: widget.score2,
                      score3: widget.score3,
                      score4: widget.score4,
                        name: widget.name,
                      age: widget.age,
                      gender: widget.gender,
                    );
                  }));
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Ok , Keep Going".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
