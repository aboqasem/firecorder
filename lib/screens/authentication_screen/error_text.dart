import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String text;

  ErrorText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontSize: viewHeight(context, 1.5),
      ),
    );
  }
}
