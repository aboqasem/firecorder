import 'package:flutter/material.dart';

class Recording {
  String name;
  bool isPlaying;

  Recording({@required this.name, this.isPlaying = false});

  void toggleState() {
    isPlaying = !isPlaying;
  }
}
