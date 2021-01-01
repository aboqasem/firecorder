import 'package:firecorder/models/recording.dart';
import 'package:firecorder/screens/home_screen/recording_tile.dart';
import 'package:firecorder/services/recordings_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecordingsService>(
      builder: (BuildContext context, RecordingsService recordingsService,
          Widget child) {
        return ListView.builder(
          itemCount: recordingsService.count,
          itemBuilder: (BuildContext context, int index) {
            final Recording recording = recordingsService.asList[index];
            return RecordingTile(
              name: recording.name,
              isPlaying: recording.isPlaying,
              onTap: () {
                recordingsService.toggleStateOf(recording.name);
              },
            );
          },
        );
      },
    );
  }
}
