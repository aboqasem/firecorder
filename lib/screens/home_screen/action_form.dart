import 'dart:io';

import 'package:firecorder/screens/home_screen/action_text_form_field.dart';
import 'package:firecorder/services/storage_service.dart';
import 'package:firecorder/services/path_service.dart';
import 'package:firecorder/services/recording_service.dart';
import 'package:flutter/material.dart';
import 'package:firecorder/screens/home_screen/action_button.dart';
import 'package:provider/provider.dart';

class ActionForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PathService _path = PathService();
  final StorageService _storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return Consumer<RecordingService>(
      builder: (BuildContext context, RecordingService recordingService,
          Widget child) {
        return Expanded(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ActionTextFormField(
                  initialValue: recordingService.recordingName,
                  onChanged: (text) {
                    recordingService.recordingName = text;
                  },
                ),
                ActionButton(
                  icon: Icon(
                    recordingService.isRecording
                        ? Icons.stop_outlined
                        : Icons.mic_outlined,
                  ),
                  onPressed: () async {
                    String recordingName = recordingService.recordingName;
                    final List<String> usedNames =
                        await _storage.userRecordings;
                    int nameNumber = 1;
                    while (usedNames.contains(recordingName + '.mp3')) {
                      recordingName =
                          '${recordingService.recordingName} (${nameNumber++})';
                    }
                    recordingName += '.mp3';
                    final File recordingFile =
                        await _path.localFile(recordingName);

                    if (!recordingService.isRecording &&
                        _formKey.currentState.validate()) {
                      await recordingService.start(recordingFile.path);
                    } else if (recordingService.isRecording) {
                      recordingService.stop();
                      await _storage.uploadRecording(
                          name: recordingName, file: recordingFile);
                      await recordingFile.delete();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
