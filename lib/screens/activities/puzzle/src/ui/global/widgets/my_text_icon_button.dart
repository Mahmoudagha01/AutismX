
import 'package:autismx/screens/activities/puzzle/src/ui/utils/responsive.dart';
import 'package:autismx/shared/local/colors.dart';
import 'package:flutter/material.dart';



class MyTextIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String label;
  final double height;
  const MyTextIconButton({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.label,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final padding = Responsive.of(context).dp(1.3);
    return TextButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          lightColor.withOpacity(0.8),
        ),
        fixedSize: MaterialStateProperty.all(
          Size.fromHeight(height),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: padding,
          ).copyWith(right: padding * 2),
        ),
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(
          Colors.black38,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      icon: icon,
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
