import 'dart:collection';

import 'package:firecorder/models/recording.dart';
import 'package:flutter/material.dart';

class RecordingsDatabase extends ChangeNotifier {
  List<Recording> _recordings = [
    Recording(name: 'rec1.mp3', isPlaying: false),
    Recording(name: 'rec2.mp3', isPlaying: false),
  ];

  UnmodifiableListView<Recording> get recordings =>
      UnmodifiableListView(_recordings);

  void add(Recording recording) {
    _recordings.add(recording);
    notifyListeners();
  }

  void toggleStateOf(Recording recording) {
    recording.toggleState();
    notifyListeners();
  }
}
