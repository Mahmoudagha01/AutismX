import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  Color colorbutton;
  Color colortext;
  final Function Answertap;

  Answer({Key key, 
    @required this.text,
    @required this.colorbutton,
     @required this.colortext,
    @required this.Answertap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
      Answertap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 180,
        height: 80,
        decoration: BoxDecoration(
          color: colorbutton,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 0),
                spreadRadius: 0,
                blurRadius: 4,
                color: Color.fromRGBO(236, 240, 243, 1))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style:  TextStyle(
                  color: colortext,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            
          
         
          ],
        ),
      ),
    );
  }
}
