import 'package:autismx/screens/BNB/screens/appstates.dart';
import 'package:autismx/screens/BNB/screens/screens_controller.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Reports extends StatelessWidget {
  const Reports({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustombackAppBar(context, () {
            Navigator.pop(context);
          }),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Reports",
              style: TextStyle(
                  color: ColorManager.blueFont,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                final reportData = AppCubit.get(context).reportData;
                if (reportData == null) {
                  return Container();
                }
                print(reportData);
                final List<dynamic> scores = reportData["scores"];
                return ListView.separated(
                    itemCount: scores.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      reportData["child_name"],
                                      style: const TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.share_outlined,
                                              color: ColorManager.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Date:     ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(scores[index]["date"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Age:      ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(
                                            scores[index]["age"].toString(),
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Gender:",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(
                                            scores[index]["gender"] == 1
                                                ? "Female"
                                                : "Male",
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Score:   ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(
                                            scores[index]["score"].toString(),
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Case:    ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(scores[index]["case"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Advice: ",
                                      style: TextStyle(
                                          color: ColorManager.blueFont,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: Text(scores[index]["advise"],
                                            style: const TextStyle(
                                              fontSize: 17,
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                            //
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(height: 3, color: Colors.black));
              },
            ),
          ),
        ],
      ),
    );
  }
}
