import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/screens/surveys/services/sqldb.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Reports extends StatelessWidget {
  const Reports({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SqlDb sqldb = SqlDb();
    Future<List<Map>> readData() async {
      List<Map> response = await sqldb.readData("SELECT * FROM report ");
      return response;
    }

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
            child: FutureBuilder(
              future: readData(),
              builder: (context, AsyncSnapshot<List<Map>> snapshot) {
                return snapshot.hasData
                    ? ListView.separated(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              elevation: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data[index]["name"],
                                          style: const TextStyle(
                                              color: ColorManager.blueFont,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Share.share(
                                                  'Name: ${snapshot.data[index]["name"]}\nDate: ${snapshot.data[index]["date"]}\nAge: ${snapshot.data[index]["age"]}\nGender: ${snapshot.data[index]["gender"]}\nScore: ${snapshot.data[index]["score"]}\nCase: ${snapshot.data[index]["case"]}\nAdvice: ${snapshot.data[index]["advice"]}',
                                                  subject: "AutismX Report",
                                                );
                                              },
                                              icon: const Icon(
                                                Icons.share_outlined,
                                                color: ColorManager.blue,
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  sqldb.deleteData(
                                                      "DELETE FROM report WHERE id = ${snapshot.data[index]["id"]}");
                                                },
                                                icon: const Icon(
                                                  Icons.delete_outline_outlined,
                                                  color: Colors.red,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                            child: Text(
                                                snapshot.data[index]["date"],
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                                snapshot.data[index]["age"]
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                                snapshot.data[index]["gender"],
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                                snapshot.data[index]["score"]
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                            child: Text(
                                                snapshot.data[index]["case"],
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                            padding: const EdgeInsets.all(
                                              8.0,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(5),
                                              border: Border.all(
                                                  color: Colors.blueAccent),
                                            ),
                                            child: Text(
                                                snapshot.data[index]["advice"],
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
                            const Divider(height: 3, color: Colors.black),
                      )
                    : const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
