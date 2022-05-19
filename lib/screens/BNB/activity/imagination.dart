

import 'package:autismx/screens/BNB/activity/activity.dart';
import 'package:autismx/screens/BNB/screens/screens.dart';
import 'package:autismx/screens/activities/maze/src/level1.dart';
import 'package:flutter/material.dart';

import '../../../shared/local/component.dart';

class Imagination extends StatefulWidget {
  const Imagination({Key key}) : super(key: key);

  @override
  State<Imagination> createState() => _ImaginationState();
}

class _ImaginationState extends State<Imagination> {
  final List<String> images = [
    'assets/images/Maze.png',
  ];

  final List<String> items = [
    'Maze',
  ];

  Widget itemCard(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => MazeLevel1()),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          color: const Color.fromRGBO(255, 227, 0, 1),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(
              3,
            ),
            child: Card(
              color: const Color.fromRGBO(255, 227, 0, 1),
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
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
                            image: DecorationImage(
                              image: AssetImage(
                                images[index],
                              ),
                            )),
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
          ),
        ),
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
               Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Screens()),
          );
              },
            ),
            const Center(
                heightFactor: 2,
                widthFactor: 1,
                child: Text(
                  'Imagination',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 227, 0, 1),
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
                    return itemCard(index, context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
