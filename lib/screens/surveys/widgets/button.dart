import 'package:autismx/screens/surveys/configs/colors.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final String buttonLabel;
  final Function onPressed;
  final bool isPrimary;
  

  Button.primary({
    @required this.buttonLabel,
    @required this.onPressed,
   
  }) : isPrimary = true;

  Button.accent({
    @required this.buttonLabel,
    @required this.onPressed,
    
  }) : isPrimary = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      
      color: isPrimary ? ColorManager.blue: Colors.white,
      shape: isPrimary
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(
                color: ColorManager.greyFont,
              ),
            ),
      child: Text(
        buttonLabel,
        style: isPrimary
            ? TextStyle(
                fontWeight: FontWeight.w700,
                color:Colors.white,
              )
            : TextStyle(
                fontWeight: FontWeight.w700,
              ),
      ),
      onPressed: onPressed,
    );
  }
}


Widget defaultButton({
  Color background = ColorManager.blue,
  bool isUpperCase = true,
  double radius = 30,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: 130,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
           text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
