import 'package:autismx/screens/common/profile_cubit.dart';
import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:autismx/shared/local/component.dart';
import 'package:autismx/shared/network/dio/parent_helper.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({Key key}) : super(key: key);
  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  final feedbackController = TextEditingController();

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
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 15,
                          offset: const Offset(9, 9),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 55),
                      child: Column(
                        children: [
                          Text(
                            ProfileCubit.get(context).parentProfile.firstName,
                            style: const TextStyle(
                                fontSize: 25,
                                color: ColorManager.blueFont,
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              'Please Send Your Feedback',
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorManager.greyFont,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/angry.gif",
                                width:
                                    MediaQuery.of(context).size.width * 0.6 / 3,
                              ),
                              Image.asset("assets/images/hearteyes.gif",
                                  width: MediaQuery.of(context).size.width *
                                      0.6 /
                                      3),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(12),
                            child: TextFormField(
                              controller: feedbackController,
                              maxLines: 8,
                              showCursor: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Type Your Message...',
                                hintStyle: const TextStyle(
                                  fontSize: 19,
                                  color: ColorManager.greyFont,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorManager.blueFont,
                              ),
                              child: MaterialButton(
                                minWidth: 140,
                                onPressed: () {
                                  ParentDioHelper.createFeedback(
                                          feedback: feedbackController.text)
                                      .then((res) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Feedback sent successfully")));
                                    Navigator.of(context).pop();
                                  }).catchError((err) {
                                    //error
                                  });
                                },
                                child: const Text(
                                  'Send',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 85,
                    child: CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      child: CircleAvatar(
                        radius: 48,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                          ProfileCubit.get(context).parentProfile.childImage,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
