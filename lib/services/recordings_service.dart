import 'dart:collection';

import 'package:firecorder/models/recording.dart';
import 'package:firecorder/models/recordings.dart';
import 'package:flutter/material.dart';

class RecordingsService extends ChangeNotifier {
  final Recordings _recordings = Recordings();

  int get count => _recordings.length;

  UnmodifiableListView<Recording> get asList =>
      UnmodifiableListView(_recordings.recordings.values);

  void add(Recording recording) {
    _recordings.add(recording);
    notifyListeners();
  }

  void toggleStateOf(String name) {
    _recordings.toggleStateOf(name);
    notifyListeners();
  }
}
