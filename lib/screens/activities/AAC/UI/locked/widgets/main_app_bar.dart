
import 'package:flutter/material.dart';


class MainAppBar extends StatelessWidget {
  final double scrollOffset;

  const MainAppBar({
    Key key,
    this.scrollOffset = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 


    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double textSize = constraints.maxHeight * 0.4;
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextButton(
              onPressed: (){} ,
              
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "AAC Keyboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textSize,
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            
            
          ],
        ),
      );
    });
  }
}
