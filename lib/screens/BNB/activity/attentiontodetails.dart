import 'package:autismx/screens/activities/matching/home.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/game_view.dart';

import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import '../../activities/puzzle/src/inject_dependencies.dart';


class AttentionToDetails extends StatefulWidget {
  const AttentionToDetails({Key key}) : super(key: key);

  @override
  State<AttentionToDetails> createState() => _AttentionToDetailsState();
}

class _AttentionToDetailsState extends State<AttentionToDetails> {
  final List<String> images = [
    'assets/images/puzzle.png',
    'assets/images/Matching.png',
  ];

  final List<String> items = [
    'Puzzle',
    'Matching',
  ];

  Widget itemCard(int index) {
    return InkWell(
      onTap: index == 0
          ?()async{
          
       setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await inject_Dependencies();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const GameView()));
                  
            }
          :(){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MatchHome()));
            },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          color: Colors.purple,
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.all(
                3,
              ),
              child:Card(
          color: Colors.purple,
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
                  'Attention To Details',
                  style: TextStyle(
                      color: Colors.purple,
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
