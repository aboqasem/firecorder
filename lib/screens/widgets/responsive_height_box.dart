import 'package:flutter/material.dart';

class ResponiveHeightBox extends StatelessWidget {
  final double percentage;

  ResponiveHeightBox(this.percentage);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (percentage / 100),
    );
  }
}
