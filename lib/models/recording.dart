import 'package:flutter/material.dart';

class Recording {
  String _name;
  bool _isPlaying;

  Recording({@required String name, bool isPlaying = false})
      : _name = name,
        _isPlaying = isPlaying;

  String get name => _name;

  bool get isPlaying => _isPlaying;

  void toggleState() {
    _isPlaying = !_isPlaying;
  }
}
