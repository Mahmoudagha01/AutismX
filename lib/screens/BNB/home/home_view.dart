import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/feedback/feedback_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';




class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Scaffoldkey,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(context: context, scaffoldkey: Scaffoldkey),
              const Text(
                'Common Symptoms',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blueFont,
                ),
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: AlignmentDirectional.bottomCenter,
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.63,
                        height: MediaQuery.of(context).size.height * 0.60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(5, 5),
                              blurRadius: 8,
                            ),
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              offset: const Offset(4, 4),
                              blurRadius: 5,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Image.asset(
                                  'assets/images/n7.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                  height:
                                      MediaQuery.of(context).size.height * 0.60,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 5.0,
                                ),
                                child: Text(
                                  'Connection Problems',
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: ColorManager.greyFont,
                                  ),
                                ),
                              ),
                            ]),
                      );
                    }),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Most Rated Centers',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blueFont,
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.60,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(6, 6),
                              blurRadius: 8,
                            ),
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              offset: const Offset(4, 4),
                              blurRadius: 5,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/center.jpg',
                              width: MediaQuery.of(context).size.width * 0.75,
                              height: MediaQuery.of(context).size.height * 0.5,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.black,
                                              size: 45,
                                            ),
                                            Text(
                                              'Cairo',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.call_outlined,
                                              color: Colors.black,
                                              size: 45,
                                            ),
                                            Text(
                                              '01027637638',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Image.asset(
                                          'assets/images/c1.png',
                                          width: 55,
                                          height: 85,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      const Text(
                                        'Autismc',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.blueFont),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
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
        }, () {}, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedbackView(),
            ),
          );
        }, () {}, () {}));
  }
}
