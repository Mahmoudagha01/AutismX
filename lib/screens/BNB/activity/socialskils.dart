import 'package:autismx/screens/activities/Emotion/src/inject_dependencies.dart';
import 'package:autismx/screens/activities/Emotion/src/ui/pages/game/Emotion_view.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import '../../../shared/local/component.dart';


class SocilSkills extends StatefulWidget {
  const SocilSkills({ Key key }) : super(key: key);

  @override
  State<SocilSkills> createState() => _SocilSkillsState();
}

class _SocilSkillsState extends State<SocilSkills> {
   final List<String> images = [
    'assets/images/Emotions.png',

  ];

  final List<String> items = [
    'Learn Emotion',
  
  ];

  Widget itemCard(int index,BuildContext context) {
    return InkWell(
      onTap: ()async{
         setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
await injectDependencies();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmotionView()));
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Card(
          color: const Color.fromRGBO(230, 126, 34, 1),
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
              padding: const EdgeInsets.all(
                3,
              ),
              child:Card(
          color: const Color.fromRGBO(230, 126, 34, 1),
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
                  'Social Skills',
                  style: TextStyle(
                      color: Color.fromRGBO(230, 126, 34, 1),
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
                    return itemCard(index,context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}