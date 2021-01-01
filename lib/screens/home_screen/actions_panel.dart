import 'package:firecorder/screens/home_screen/action_form.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class ActionsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(viewHeight(context, 5)),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ActionForm(),
        ],
      ),
    );
  }
}
