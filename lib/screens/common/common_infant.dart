import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class CommonInfant extends StatefulWidget {
  @override
  _CommonInfantState createState() => _CommonInfantState();
}

class _CommonInfantState extends State<CommonInfant > {
  List<Map<String, String>> images = [
    {
      "image": "assets/images/slider_common/Not smile.png",
      "title": "The child does not smile.",
    },
    {
      "image": "assets/images/slider_common/Do not show warm.png",
      "title": "does not show a warm or cheerful expression.",
    },
    {
      "image": "assets/images/slider_common/sound.png",
      "title": "Not responding to sounds from the front or back.",
    },
    {
      "image": "assets/images/slider_common/Do not say any word.png",
      "title": "The child does not say any single words or others.",
    },
    {
      "image": "assets/images/slider_common/gestures.png",
      "title": "The absence of gestures, such as: waving or pointing at something.",
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
           _buildCont(0),_buildCont(1),_buildCont(2),_buildCont(3),_buildCont(4),
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
