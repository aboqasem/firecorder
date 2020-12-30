import 'package:flutter/material.dart';

double responsiveWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * (percentage / 100);
}

double responsiveHeight(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.height * (percentage / 100);
}
