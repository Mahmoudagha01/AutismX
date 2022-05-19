import 'package:autismx/shared/local/component.dart';
import 'package:flutter/material.dart';

class Social extends StatelessWidget {
  const Social({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustombackAppBar(context, ()=>Navigator.pop(context)),
        
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height*0.6 ,
              child: Image.asset("assets/images/Social.gif"),
            ),
          ),
        ],
      ),
    );
  }
}