import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({ Key key }) : super(key: key);

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustombackAppBar(context),
        ],
      ),
    );
  }
}