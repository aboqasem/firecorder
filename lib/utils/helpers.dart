import 'package:flutter/material.dart';

double viewWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * (percentage / 100);
}

double viewHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * (percentage / 100);
}
