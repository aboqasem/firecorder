import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String text;

  ErrorText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.red,
        fontSize: viewHeight(context, 2),
      ),
    );
  }
}
