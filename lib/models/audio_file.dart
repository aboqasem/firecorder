import 'package:flutter/material.dart';

class AudioFile extends ChangeNotifier {
  bool _isRecording = false;

  bool get isRecording => _isRecording;

  void toggleState() {
    _isRecording = !_isRecording;
    notifyListeners();
  }
}
