import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'An error occurred while initializing the app.',
      style: TextStyle(
        color: Colors.red,
        fontSize: viewHeight(context, 2),
      ),
    );
  }
}
