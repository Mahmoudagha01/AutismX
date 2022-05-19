import 'package:autismx/screens/activities/learn_time/StartClock.dart';
import 'package:flutter/material.dart';

import '../../../shared/local/component.dart';
import '../../activities/learn_basic/CategoryScreen.dart';

class Learning extends StatefulWidget {
  const Learning({ Key key }) : super(key: key);

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
   final List<String> images = [
    'assets/images/confirm.png',
    'assets/images/clocknew.png',
  ];

  final List<String> items = [
    'Learn Basic',
    'Learn Time ',
  ];
List route=[
  const CategoryScreen(),
const StartClock()
];

  Widget itemCard(int index) {
    return InkWell(
      onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>route[index]));
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          color: const Color.fromRGBO(239, 61, 94, 1),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.all(
                3,
              ),
              child:Card(
          color: const Color.fromRGBO(239, 61, 94, 1),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.all(
                3,
              ),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        image: DecorationImage(image:AssetImage(images[index],),)
                      ),
                      margin: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.longestSide / 6,
                      ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 2),
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      items[index],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              )),
        ),
      ),),
        
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustombackAppBar(
              context,
              () {
                Navigator.pop(context);
              },
            ),
            const Center(
                heightFactor: 2,
                widthFactor: 1,
                child: Text(
                  'Learning',
                  style: TextStyle(
                      color: Color.fromRGBO(239, 61, 94, 1),
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height - 230,
              child: ListView.builder(
                  // padding: EdgeInsets.only(top: 50),

                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return itemCard(index);
                  }),
            )
          ],
        ),
      ),
    );
  }
}