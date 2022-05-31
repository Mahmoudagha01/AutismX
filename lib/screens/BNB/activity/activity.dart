import 'package:autismx/screens/BNB/activity/attentionswitshng.dart';
import 'package:autismx/screens/BNB/activity/attentiontodetails.dart';
import 'package:autismx/screens/BNB/activity/comunication.dart';
import 'package:autismx/screens/BNB/activity/imagination.dart';
import 'package:autismx/screens/BNB/activity/learning.dart';
import 'package:autismx/screens/BNB/activity/socialskils.dart';
import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/feedback/feedback_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

import '../../reports/reports_view.dart';

class Activity extends StatefulWidget {
  const Activity({Key key}) : super(key: key);

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  Widget _activityCard(int index) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  catgscreens[index]),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(Catg[index]["image"]))),
              ),
            Text(
                Catg[index]["title"],
                style: const TextStyle(fontSize: 17, color: ColorManager.greyFont),
              )
            ],
          ),
          // Center(
          //     child: Text(
          //   questionnaire.name,
          //   style: const TextStyle(fontSize: 22),
          // )),
        ));
  }

  List<Map<String, String>> Catg = [
    {"title": "Learning", "image": "assets/images/learning.png"},
    {"title": "Social Skills", "image": "assets/images/social.png"},
    {"title": "Attention To Details", "image": "assets/images/detail.png"},
    {"title": "Attention Switching", "image": "assets/images/switch.png"},
    {"title": "Communication", "image": "assets/images/communication.png"},
    {"title": "Imagination", "image": "assets/images/img.png"},
  ];
  List catgscreens = [
    const Learning(),
    const SocilSkills(),
    const AttentionToDetails(),
    const AttentionSwitching(),
    const Communication(),
    const Imagination()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(context: context, scaffoldkey: Scaffoldkey),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _activityCard(index);
                },
              ),
            ),
          ],
        ),
      ),
      endDrawer: myDrawer(
          context,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CenterLayout(),
              ),
            );
          },
          () {Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Reports(),
                ),
              );},
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FeedbackView(),
              ),
            );
          },
          () {},
          () {}),
    );
  }
}
