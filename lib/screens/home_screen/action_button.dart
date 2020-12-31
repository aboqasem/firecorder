import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;

  ActionButton({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: IconButton(
        color: Colors.white,
        iconSize: viewWidth(context, 8),
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
