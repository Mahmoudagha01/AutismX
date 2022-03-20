
import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/common/common_view.dart';
import 'package:autismx/screens/feedback/feedback_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  Widget AgeCard(){
    return  InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Common()));
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    // The alignment of the effect(x,y)
                                    spreadRadius: 1,
                                    //Spread radius means how much it will spread
                                    blurRadius: 5,
                                    //How big the blus will be
                                    color: Colors.grey //color of the effect.
                                    )
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 160,
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 110,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      image:  AssetImage(
                                        "assets/images/infant.png",
                                      ),
                                    )),
                              ),
                              
                              const Text(
                                "Infant",
                                style:  TextStyle(
                                    color: Color.fromARGB(255, 122, 122, 122),
                                    fontSize: 20),
                              )
                            ],
                          ),
                    ),
      ),
    );
  }
  GlobalKey<ScaffoldState> scaffoldkey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 key:scaffoldkey ,
      body: Column(
        children: [
        SafeArea(child: fullAppbar(context: context,scaffoldkey: scaffoldkey)),
          const Text(
            'Age Categories',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 39, 143, 221),
                fontSize: 30),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 4,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return AgeCard();
                }),
          )
        ],
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
        }, () {},() {
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
