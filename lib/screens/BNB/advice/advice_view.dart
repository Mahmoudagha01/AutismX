import 'package:autismx/screens/age/age_view.dart';
import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';


class Advices extends StatefulWidget {
  const Advices({Key key}) : super(key: key);

  @override
  State<Advices> createState() => _AdvicesState();
}

class _AdvicesState extends State<Advices> {
    GlobalKey<ScaffoldState> Scaffoldkey=GlobalKey<ScaffoldState>();
  @override
 
  Widget build(BuildContext context) {
    Widget _Advice() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        width: MediaQuery.of(context).size.width - 50,
    
        decoration: BoxDecoration(
          color: Colors.white,
             borderRadius: BorderRadius.circular(15),boxShadow: const [
                 BoxShadow(
                          offset: Offset(3, 3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          color: Colors.grey)
             ]),
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/Six.png",
                  ),
                )),
          ),
          const Text("involve him in group and charitable activities",style: const TextStyle(fontSize: 17,color:ColorManager.greyFont),)
        ]),
      );
    }

    return Scaffold(
       key: Scaffoldkey,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(context:context,scaffoldkey:Scaffoldkey),
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
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.25,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Age()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/teenagers.png"))),
                      ),
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Detailed",
                        style: TextStyle(
                            color: ColorManager.greyFont, fontSize: 20),
                      ),
                    )),
                  ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.25,
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
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/teenagers.png"))),
                      ),
                    ),
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        "Social",
                        style: TextStyle(
                            color: ColorManager.greyFont, fontSize: 20),
                      ),
                    )),
                  ]),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text('Some advices will help you'),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _Advice();
                },
              ),
            ),
          ],
        ),
      ),
      endDrawer: myDrawer(context, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        },() {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CenterLayout(),
            ),
          );
        }, () {}, () {}, () {}, () {}),
    );
  }
}
