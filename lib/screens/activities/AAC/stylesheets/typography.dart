import 'package:flutter/material.dart';

import 'constants.dart';

class Typography {
  static TextStyle header() {
    return const TextStyle(
        color: mine_shaft, fontSize: 20, fontWeight: FontWeight.bold);
  }

  static TextStyle subheader() {
    return const TextStyle(color: mine_shaft, fontSize: 15);
  }

  static TextStyle label() {
    return const TextStyle(color: electric_violet);
  }

  static TextStyle description() {
    return const TextStyle();
  }

  static TextStyle title() {
    return const TextStyle(color: mine_shaft, fontSize: 14);
  }

  static TextStyle subTitle() {
    return const TextStyle(color: mine_shaft, fontSize: 12);
  }
}
