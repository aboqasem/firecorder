import 'package:firecorder/models/recording.dart';
import 'package:firecorder/models/recordings_database.dart';
import 'package:firecorder/screens/home_screen/recording_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecordingsDatabase>(
      builder: (BuildContext context, RecordingsDatabase recordingsDatabase,
          Widget child) {
        return ListView.builder(
          itemCount: recordingsDatabase.recordings.length,
          itemBuilder: (BuildContext context, int index) {
            final Recording recording = recordingsDatabase.recordings[index];
            return RecordingTile(
              name: recording.name,
              isPlaying: recording.isPlaying,
              onTap: () {
                recordingsDatabase.toggleStateOf(recording);
              },
            );
          },
        );
      },
    );
  }
}
