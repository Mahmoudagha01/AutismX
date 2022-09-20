import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:autismx/screens/centers/center_view.dart';
import 'package:autismx/screens/feedback/feedback_view.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/reports/reports_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

List<Map<String, String>> images = [
  {
    "image": "assets/images/n1.png",
    "title": "Hyperactive",
  },
  {
    "image": "assets/images/n2.png",
    "title": "Depression",
  },
  {
    "image": "assets/images/n3.png",
    "title": "Rejecting Cuddles.",
  },
  {
    "image": "assets/images/n4.png",
    "title": "Not Responding.",
  },
  {
    "image": "assets/images/n5.png",
    "title": "Epilepsy.",
  },
  {"image": "assets/images/n6.png", "title": "Prefer to Play Alone."},
  {"image": "assets/images/n7.png", "title": "Connection Problems."},
  {"image": "assets/images/n8.png", "title": "Learning Disability."},
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
        color: _currentindex == index
            ? Colors.blue
            : Colors.grey.withOpacity(0.3)),
  );
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Scaffoldkey,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(context: context, scaffoldkey: Scaffoldkey),
              const Text(
                'Common Symptoms',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blueFont,
                ),
              ),
              Expanded(
                flex: 4,
                child: CarouselSlider.builder(
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
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width - 50,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.25,
                            child: Image.asset(
                              images[index]["image"],
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Spacer(),
                          FittedBox(
                            child: Text(
                              images[index]["title"],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 21, color: ColorManager.greyFont),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCont(0),
                  _buildCont(1),
                  _buildCont(2),
                  _buildCont(3),
                  _buildCont(4),
                  _buildCont(5),
                  _buildCont(6),
                  _buildCont(7),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Most Rated Centers',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.blueFont,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                flex: 3,
                child: BlocConsumer<AppCubit, AppStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    final centers = AppCubit.get(context).highCentersList;
                    return ListView.builder(
                        itemCount: centers.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width * 0.9,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  offset: const Offset(6, 6),
                                  blurRadius: 8,
                                ),
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  offset: const Offset(4, 4),
                                  blurRadius: 5,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/center.jpg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  fit: BoxFit.cover,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.black,
                                                    size: 40,
                                                  ),
                                                  FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      centers[index]["center"]
                                                          ["address"],
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.call_outlined,
                                                    color: Colors.black,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    centers[index]["center"]
                                                        ["phone"],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, bottom: 5),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  foregroundImage: NetworkImage(
                                                    centers[index]["center"]
                                                        ["center_photo"],
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  centers[index]["center"]
                                                      ["centerName"],
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorManager
                                                          .blueFont),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SmoothStarRating(
                                      rating:
                                          (centers[index]["validation"] as int)
                                              .toDouble(),
                                      isReadOnly: false,
                                      size: 30,
                                      filledIconData: Icons.star,
                                      halfFilledIconData: Icons.star_half,
                                      defaultIconData: Icons.star_border,
                                      starCount: 5,
                                      allowHalfRating: true,
                                      spacing: 2.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
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
        }, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Reports(),
            ),
          );
        }, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FeedbackView(),
            ),
          );
        }, () {}, () {}));
  }
}
