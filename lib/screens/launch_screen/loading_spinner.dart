import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: Colors.black,
      size: viewHeight(context, 5),
    );
  }
}
