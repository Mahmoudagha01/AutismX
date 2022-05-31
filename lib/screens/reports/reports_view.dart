
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  const Reports({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        
        children: [
          CustombackAppBar(context, (){Navigator.pop(context);}),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child:  Text("Reports",style: TextStyle(
                                        color: ColorManager.blueFont,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Add Name Here",
                                  style: TextStyle(
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                            BorderRadiusDirectional.circular(5),
                                        border: Border.all(color: Colors.blueAccent)),
                                    child: const Text("Add Data Here",
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                            BorderRadiusDirectional.circular(5),
                                        border: Border.all(color: Colors.blueAccent)),
                                    child: const Text("Add Data Here",
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                            BorderRadiusDirectional.circular(5),
                                        border: Border.all(color: Colors.blueAccent)),
                                    child: const Text("Add Data Here",
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                            BorderRadiusDirectional.circular(5),
                                        border: Border.all(color: Colors.blueAccent)),
                                    child: const Text("Add Data Here",
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                            BorderRadiusDirectional.circular(5),
                                        border: Border.all(color: Colors.blueAccent)),
                                    child: const Text("Add Data Here",
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                            BorderRadiusDirectional.circular(5),
                                        border: Border.all(color: Colors.blueAccent)),
                                    child: const Text("Add Data Here",
                                        style: TextStyle(
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
            }, separatorBuilder: (BuildContext context, int index) => const Divider( height: 3, color: Colors.black), itemCount: 4),
          ),
        ],
      ),
    );
  }
}