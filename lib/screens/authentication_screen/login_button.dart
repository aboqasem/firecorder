import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPressed;

  LoginButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Login',
        style: TextStyle(fontSize: viewHeight(context, 2)),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: Colors.white,
          minimumSize: Size(viewWidth(context, 110), viewHeight(context, 5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
    );
  }
}
