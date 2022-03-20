import 'package:flutter/material.dart';

class MaxTextScaleFactor extends StatelessWidget {
  final Widget child;
  final double max;
  const MaxTextScaleFactor({
    Key key,
    @required this.child,
    this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    var textScaleFactor = mediaQueryData.textScaleFactor;
    if (max == null && textScaleFactor > 1.4) {
      textScaleFactor = 1.4;
    } else if (max != null && textScaleFactor >= max) {
      textScaleFactor = max;
    }

    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: child,
    );
  }
}
