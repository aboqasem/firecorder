import 'package:flutter/material.dart';

class Recording {
  final String _name;
  final String _url;
  bool _isPlaying;

  Recording({
    @required String name,
    @required String url,
    bool isPlaying = false,
  })  : _name = name,
        _url = url,
        _isPlaying = isPlaying;

  String get name => _name;

  String get url => _url;

  bool get isPlaying => _isPlaying;

  void toggleState() {
    _isPlaying = !_isPlaying;
  }
}
