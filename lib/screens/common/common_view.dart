import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class Common extends StatefulWidget {
  @override
  _CommonState createState() => _CommonState();
}

class _CommonState extends State<Common> {
  List<Map<String, String>> images = [
    {
      "image": "assets/images/slider_common/1.png",
      "title": "Impaired ability to talk and talk to others.",
    },
    {
      "image": "assets/images/slider_common/2.png",
      "title": "Not responding to orders and instructions.",
    },
    {
      "image": "assets/images/slider_common/3.png",
      "title": "Excessive movement.",
    },
    {
      "image": "assets/images/slider_common/4.png",
      "title": "Walking on tiptoes frequently.",
    },
    {
      "image": "assets/images/slider_common/5.png",
      "title": "Difficulty expressing fewlings.",
    },
    {
      "image": "assets/images/slider_common/6.png",
      "title": "Doesn't make eye contact with you."
    },
  ];
  int _currentindex = 0;
  Widget _buildCont(int index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 20,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          shape: BoxShape.rectangle,
          color:
              _currentindex == index ? Colors.blue : Colors.grey.withOpacity(0.3)),
    );
  }

  @override
    GlobalKey<ScaffoldState> scaffoldkey=GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    return Scaffold(
       key:scaffoldkey ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(child: fullAppbar(context: context,scaffoldkey:scaffoldkey )),
           
           Padding(
              padding: const EdgeInsets.only(bottom: 25,top: 20),
              child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: const [
             Text(
               'Common Symptoms',
               style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Color.fromARGB(255, 39, 143, 221),
                   fontSize: 25),
             ),
           ],
              ),
            ),
            Column(
              children: [
           CarouselSlider.builder(
             itemCount: images.length,
             options: CarouselOptions(
                 onPageChanged: (index, _) {
                   setState(() {
                     _currentindex = index;
                   });
                 },
                 initialPage: 0,
                 autoPlay: true,
                 height: MediaQuery.of(context).size.height * 0.45),
             itemBuilder: (context, index) => Container(
               margin: const EdgeInsets.all(10),
               decoration: BoxDecoration(
                   boxShadow: const [
                     BoxShadow(
                         offset: Offset(1, 0),
                         // The alignment of the effect(x,y)
                         spreadRadius: 0,
                         //Spread radius means how much it will spread
                         blurRadius: 4,
                         //How big the blus will be
                         color: Colors.grey //color of the effect.
                         )
                   ],
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(15)),
             
               child: Container(
                   height: MediaQuery.of(context).size.height * 0.3,
               width: MediaQuery.of(context).size.width - 50,
                 child: Column(
                   children: [
                     const Spacer(),
                     Container(
                       height: MediaQuery.of(context).size.height * 0.3,
                       child: Image.asset(
                         images[index]["image"],
                         fit: BoxFit.fill,
                       ),
                     ),
                     const Spacer(),
                     Text(
                       images[index]["title"],
                       textAlign: TextAlign.center,
                       style: const TextStyle(
                           fontSize: 21, color: ColorManager.greyFont),
                     ),
                     const Spacer()
                   ],
                 ),
               ),
             ),
           ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
           _buildCont(0),_buildCont(1),_buildCont(2),_buildCont(3),_buildCont(4),_buildCont(5),
              ],
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
        }, () {
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
