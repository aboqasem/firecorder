import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

class RecordingService extends ChangeNotifier {
  String recordingName = 'Recording';
  bool _isRecording = false;
  RecordMp3 _recordMp3 = RecordMp3.instance;

  bool get isRecording => _isRecording;

  Future<bool> _permission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  Future<void> start(String path) async {
    if (!_isRecording && await _permission()) {
      _isRecording = _recordMp3.start(path, (e) => print(e));
      notifyListeners();
    }
  }

  void stop() {
    if (_isRecording) {
      _isRecording = !_recordMp3.stop();
      notifyListeners();
    }
  }
}
