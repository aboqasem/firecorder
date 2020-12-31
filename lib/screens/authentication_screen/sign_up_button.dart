import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final void Function() onPressed;

  SignUpButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        'Sign Up',
        style: TextStyle(fontSize: viewHeight(context, 2)),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        minimumSize: Size(viewWidth(context, 100), viewHeight(context, 5)),
        side: BorderSide(width: 2, color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
