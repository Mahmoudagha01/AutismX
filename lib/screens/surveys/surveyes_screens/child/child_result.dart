import 'dart:math';
import 'package:autismx/screens/BNB/screens/screens.dart';
import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../shared/network/dio/parent_helper.dart';

class ResultScreen extends StatefulWidget {
  final String questionnaireName;
  final int score;

  final String name;
  final String age;
  final String gender;
  ResultScreen({
    @required this.questionnaireName,
    this.score,
    @required this.name,
    @required this.age,
    @required this.gender,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int score = widget.score;
    String _getinterpretation() {
      if (score <= 2) {
        return "The Score indicates low risk";
      } else if (score <= 7 && score >= 3) {
        return "The Score indicates Medium risk";
      } else if (score >= 8) {
        return "The Score indicates High risk";
      }
    }

    String _getadvice() {
      if (score <= 2) {
        return "if child is younger than 24 months, you should screen again after second birthday. No further action required unless surveillance indicates risk for ASD.";
      } else if (score <= 7 && score >= 3) {
        return "You Should to take your child to his or her doctor for a follow-up screenin.You can also seek early intervention services for your child";
      } else if (score >= 8) {
        return "You should to take your child to his or her doctor for a full evaluation.You Should also begin early intervention services for your child.";
      }
    }

    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Report"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                     Share.share(
                                              'Name: ${widget.name} \nDate: $formattedDate\nAge: ${widget.age}\nGender: ${widget.gender == 1 ? "Female" : "Male"}\nScore: $widget.total \nCase: ${_getinterpretation()} \nAdvice: ${_getadvice}',
                                              subject: "AutismX Report",
                                            );
                                  },
                                  icon: const Icon(
                                    Icons.share_outlined,
                                    color: ColorManager.blue,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print("saved");
                                    ParentDioHelper.postParentScore(
                                            score: score,
                                            advise: _getadvice(),
                                            childCase: _getinterpretation(),
                                            date: formattedDate,
                                            childAge: int.parse(widget.age),
                                            childGender:
                                                widget.gender == "female"
                                                    ? 1
                                                    : 0)
                                        .then((response) {
                                           ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Report Saved successfully")));
                                        })
                                        .catchError((error) {});
                                  },
                                  icon: const Icon(
                                    Icons.save_outlined,
                                    color: ColorManager.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Date:     ",
                            style: TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(formattedDate,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Age:      ",
                            style: TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text("${widget.age} years old",
                                  style: const TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Gender:",
                            style: TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(widget.gender,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Score:   ",
                            style: TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text("$score",
                                  style: const TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Case:    ",
                            style: TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(_getinterpretation(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Advice: ",
                            style: TextStyle(
                                color: ColorManager.blueFont,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(_getadvice(),
                                  style: const TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  //
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorManager.blue,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CenterLayout()));
                },
                child: const Text('Specialists Recommendations',
                    style: TextStyle(fontSize: 20.0)),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorManager.blue,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screens()));
                },
                child: const Text('Go Home', style: TextStyle(fontSize: 20.0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
