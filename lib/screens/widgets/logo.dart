import 'dart:math';

import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.graphic_eq,
      size: min(
        viewWidth(context, 50),
        viewHeight(context, 50),
      ),
    );
  }
}
