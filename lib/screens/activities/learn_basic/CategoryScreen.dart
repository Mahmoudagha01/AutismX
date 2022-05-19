import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

import 'ActivityScreen.dart';
import 'AnimalScreen.dart';
import 'ColorScreen.dart';
import 'ConversationScreen.dart';
import 'FeelingScreen.dart';
import 'FoodScreen.dart';
import 'NumberScreen.dart';
import 'PeopleScreen.dart';
import 'SchoolScreen.dart';
import 'ShapeScreen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // List<Color> colorlist = List.generate(8, (index) => Colors.primaries[index]);
  final List<Color> _defultColor = [
    Colors.lightBlueAccent,
    const Color.fromRGBO(248, 187, 208, 1),
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.limeAccent,
    Colors.greenAccent,
    Colors.cyanAccent.shade200,
    Colors.lightGreen.shade400,
    Colors.pinkAccent.shade100,
    Colors.amber.shade300
  ];

  final List<Map<String, String>> _listinfo = [
    {'text': 'People', 'image': 'assets/image/people.png'},
    {'text': 'Conversations', 'image': 'assets/image/conversation.png'},
    {'text': 'School', 'image': 'assets/image/school.png'},
    {'text': 'Animals', 'image': 'assets/image/animals.png'},
    {'text': 'Colors', 'image': 'assets/image/colors.png'},
    {'text': 'Food', 'image': 'assets/image/food.png'},
    {'text': 'Feeling', 'image': 'assets/image/feeling.png'},
    {'text': 'Activities', 'image': 'assets/image/activites.png'},
    {'text': 'Numbers', 'image': 'assets/image/numbers2.png'},
    {'text': 'Shapes', 'image': 'assets/image/shapes.png'},
  ];

  final List<Widget> _OpenScreen = [
    PeopleScreen(),
    ConversationScreen(),
    SchoolScreen(),
    AnimalScreen(),
    ColorScreen(),
    FoodScreen(),
    FeelingScreen(),
    ActivityScreen(),
    NumberScreen(),
    ShapeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustombackAppBar(
            context,
            () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    mainAxisExtent: 150,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10),
                itemCount: _listinfo.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) {
                          return _OpenScreen[index];
                        }),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _defultColor[index]
                          // color:Color.fromRGBO(255, 228, 226, 1),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              '${_listinfo[index]['image']}',
                              height: 105,
                              width: 120,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                '${_listinfo[index]['text']}',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
