import 'package:autismx/screens/activities/matching/colormatch.dart';
import 'package:autismx/screens/activities/matching/numbermatch.dart';
import 'package:autismx/screens/activities/matching/opposite.dart';
import 'package:autismx/screens/activities/matching/pairsmatch.dart';
import 'package:autismx/screens/activities/matching/shadowmatch.dart';
import 'package:autismx/screens/activities/matching/wordmatch.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';


class MatchHome extends StatefulWidget {
  @override
  State<MatchHome> createState() => _MatchHomeState();
}

class _MatchHomeState extends State<MatchHome> {
  List<Map> cards = [
    {
      "image": "assets/match_images/sen.png",
      "title": "Word",
      Color: const Color.fromRGBO(56, 214, 231, 1),
      "goto": WordMatch()
    },
    {
      "image": "assets/match_images/bag 1.png",
      "title": "Color",
      Color: const Color.fromRGBO(73, 132, 192, 1),
      "goto": ColorMatch()
    },
    {
      "image": "assets/match_images/butterfly.png",
      "title": "Pairs",
      Color: const Color.fromRGBO(255, 109, 114, 1),
      "goto": PairsMatch()
    },
    {
      "image": "assets/match_images/up.png",
      "title": "Opposite",
      Color: const Color.fromARGB(255, 243, 232, 78),
      "goto": OppositeMatch()
    },
    {
      "image": "assets/match_images/2.1.png",
      "title": "Shadow",
      Color: const Color.fromRGBO(0, 186, 106, 1),
      "goto": ShadowMatch()
    },
    {
      "image": "assets/match_images/3new.png",
      "title": "Number",
      Color: const Color.fromRGBO(243, 84, 8, 1),
      "goto": NumbersMatch()
    },
  ];
  Widget itemcard(int index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return cards[index]["goto"];
          }),
        );
      },
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset("assets/match_images/match ${index + 1}.png"),
        ),
        Positioned(
          left: 50,
          top: 20,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(cards[index]["image"]),
          ),
        ),
        Positioned(
            bottom: 30,
            left: 35,
            child: Text(
              "${cards[index]["title"]}",
              style: TextStyle(
                  color: cards[index][Color],
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CustombackAppBar(context, (){Navigator.pop(context);}),
        Expanded(
            child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 20),
                itemBuilder: (context, index) {
                  return itemcard(index);
                }))
      ]),
    );
  }
}
