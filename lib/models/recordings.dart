import 'dart:collection';

import 'package:firecorder/models/recording.dart';

class Recordings {
  final Map<String, Recording> _recordings = Map<String, Recording>();

  int get length => _recordings.length;

  UnmodifiableMapView<String, Recording> get recordings =>
      UnmodifiableMapView(_recordings);

  void add(Recording recording) {
    _recordings[recording.name] = _recordings[recording.name] ?? recording;
  }

  void toggleStateOf(String name) {
    _recordings[name].toggleState();
  }
}
