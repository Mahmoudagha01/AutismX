
import 'package:autismx/screens/activities/puzzle/src/inject_dependencies.dart';
import 'package:autismx/screens/activities/puzzle/src/ui/pages/game/game_view.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

class AttentionToDetails extends StatefulWidget {
  const AttentionToDetails({Key key}) : super(key: key);

  @override
  State<AttentionToDetails> createState() => _AttentionToDetailsState();
}

class _AttentionToDetailsState extends State<AttentionToDetails> {
  final List<String> images = [
    'assets/images/puzzledept.jpg',
    'assets/images/Memory cardsjpg.jpg',
    'assets/images/Matchingjpg.jpg',
    'assets/images/Differencesjpg.jpg',
  ];

  final List<String> items = [
    'Puzzle',
    'Memory Cards',
    'Matching',
    'Differences',
  ];

  Widget itemCard(int index) {
    return InkWell(
      onTap: () async {
        await injectDependencies();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GameView()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(37),
                bottomLeft: Radius.circular(60),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              border: Border.all(color: Colors.purple, width: 3)),
          child: Card(
            color: Colors.white,
            elevation: 8,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(37),
              bottomLeft: Radius.circular(55),
            )),
            child: Padding(
                padding: const EdgeInsets.only(
                  top: 7,
                ),
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.longestSide / 5,
                        child: Image(image: AssetImage(images[index]))),
                    
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 2),
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        items[index],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    )
                  ],
                )),
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
            CustombackAppBar(context,() {
              Navigator.pop(context);
            },),
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
            Expanded(
              child: GridView.builder(
                  // padding: EdgeInsets.only(top: 50),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .77 ,
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                  ),
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
