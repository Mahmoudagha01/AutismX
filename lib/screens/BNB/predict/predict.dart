import 'package:autismx/screens/BNB/predict/uploadimage.dart';
import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/feedback/feedback_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/surveyes_screens/intro.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import '../../reports/reports_view.dart';

class Predict extends StatefulWidget {
  const Predict({Key key}) : super(key: key);

  @override
  State<Predict> createState() => _PredictState();
}

class _PredictState extends State<Predict> {
  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Scaffoldkey,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(context: context, scaffoldkey: Scaffoldkey),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Intro()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(3, 3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          color: Colors.grey),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/survey.png"),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Using Survey",
                          style: TextStyle(
                            fontSize: 19,
                            color: ColorManager.greyFont,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadImage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(3, 3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          color: Colors.grey),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Upload1.png"),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Upload Image",
                          style: TextStyle(
                            fontSize: 19,
                            color: ColorManager.greyFont,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
        endDrawer: myDrawer(context, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        }, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CenterLayout(),
            ),
          );
        }, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Reports(),
            ),
          );
        }, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FeedbackView(),
            ),
          );
        }, () {}, () {}));
  }
}
