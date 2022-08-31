import 'package:autismx/screens/BNB/advice/social.dart';
import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:autismx/screens/age/age_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../centers/center_view.dart';
import '../../feedback/feedback_view.dart';
import '../../profile/profile_view.dart';
import '../../reports/reports_view.dart';

class Advices extends StatefulWidget {
  const Advices({Key key}) : super(key: key);

  @override
  State<Advices> createState() => _AdvicesState();
}

class _AdvicesState extends State<Advices> {
  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Widget _Advice(int index, var list) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: MediaQuery.of(context).size.width - 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(3, 3),
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: Colors.grey)
            ]),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image:
                    DecorationImage(image: NetworkImage(list[index]["image"]))),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FittedBox(
              child: Text(
                list[index]["advice"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 17,
                    color: ColorManager.greyFont),
              ),
            ),
          )
        ]),
      );
    }

    return Scaffold(
      key: Scaffoldkey,
      body: SafeArea(
        child: Column(children: [
          CustomAppBar(context: context, scaffoldkey: Scaffoldkey),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Symptoms",
              style: TextStyle(
                  fontSize: 22,
                  color: ColorManager.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: Colors.grey)
                  ],
                ),
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Age()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.16,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: AssetImage("assets/images/Detailed.png"))),
                    ),
                  ),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Detailed",
                      style:
                          TextStyle(color: ColorManager.greyFont, fontSize: 20),
                    ),
                  )),
                ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(3, 3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        color: Colors.grey)
                  ],
                ),
                child: Column(children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Social()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.16,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/social.png"),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Social",
                      style:
                          TextStyle(color: ColorManager.greyFont, fontSize: 20),
                    ),
                  )),
                ]),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              'Some advices will help you',
              style: TextStyle(
                  fontSize: 22,
                  color: ColorManager.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: BlocConsumer<AppCubit, AppStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  var list = AppCubit.get(context).advicesList;
                  return ConditionalBuilder(
                    condition: state is! GetAdvicesLoadingState,
                    builder: (context) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return _Advice(index, list);
                      },
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  );
                }),
          ),
        ]),
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
              builder: (context) => FeedbackView(),
            ),
          );
        }, () {}, () {}),
    );
  }
}
