import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:autismx/screens/profile/profile_view.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../BNB/screens/appstates.dart';

class CenterLayout extends StatefulWidget {
  @override
  State<CenterLayout> createState() => _CenterLayoutState();
}

var searchController = TextEditingController();
var searchQuery = "";

class _CenterLayoutState extends State<CenterLayout> {
  PageController pc;
  Widget center(Map<String, dynamic> center) {
    final List<dynamic> _images = center["images"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width - 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                spreadRadius: 1,
                blurRadius: 5,
                color: Colors.grey)
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.34,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width - 60,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/drawer1.png"),
                              fit: BoxFit.fill))),
                  if (_images.isNotEmpty)
                    CarouselSlider.builder(
                      itemCount: _images.length,
                      options: CarouselOptions(
                          initialPage: 0,
                          autoPlay: true,
                          height: MediaQuery.of(context).size.height * 0.3),
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Image.network(
                                _images[index]["image"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Positioned(
                    bottom: 10,
                    left: 58,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                          center["center_photo"],
                        ),
                      ),
                    ),
                    // child: Container(
                    //     width: 80,
                    //     height: 80,
                    //     decoration: const BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Colors.white,
                    //     ),
                    //     child: Image.network(
                    //       center["center_photo"],
                    //       fit: BoxFit.fill,
                    //     )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              center["centerName"],
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.blue,
                ),
                Text(
                  center["address"],
                  style: const TextStyle(
                      color: ColorManager.greyFont,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.call,
                  color: Colors.blue,
                ),
                Text(
                  center["phone"],
                  style: const TextStyle(
                      color: ColorManager.greyFont,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SmoothStarRating(
              rating: 0,
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
      ),
    );
  }

  GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      body: Column(
        children: [
          SafeArea(
              child: fullAppbar(context: context, scaffoldkey: Scaffoldkey)),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: defaultFormField(
              controller: searchController,
              type: TextInputType.text,
              validate: (String value) {
                if (value.isEmpty) {
                  return 'search must not be empty';
                }
                return null;
              },
              onChange: (data) {
                setState(() {
                  searchQuery = data.toLowerCase();
                });
              },
              label: 'Search',
              prefix: Icons.search,
            ),
          ),
          Expanded(
            child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                List<dynamic> centers = searchQuery == ""
                    ? AppCubit.get(context).centersList
                    : AppCubit.get(context)
                        .centersList
                        .where((c) =>
                            c["address"]
                                .toString()
                                .toLowerCase()
                                .contains(searchQuery) ||
                            c["centerName"]
                                .toString()
                                .toLowerCase()
                                .contains(searchQuery))
                        .toList();
                return ListView.builder(
                  itemCount: centers.length,
                  itemBuilder: (context, index) {
                    return center(centers[index]);
                  },
                );
              },
            ),
          ),
        ],
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