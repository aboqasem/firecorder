import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecorder/models/recording.dart';
import 'package:firecorder/screens/home_screen/recording_tile.dart';
import 'package:firecorder/services/recordings_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsListView extends StatelessWidget {
  void subscribe(RecordingsService recordingsService) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference recordings = firestore.collection('recordings');
    await for (QuerySnapshot snapshot in recordings.snapshots()) {
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        Map<String, dynamic> recording = doc.data();
        if (recording['uid'] == FirebaseAuth.instance.currentUser.uid) {
          recordingsService.add(Recording(
            name: recording['recording_name'],
            url: recording['recording_link'],
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecordingsService>(
      builder: (BuildContext context, RecordingsService recordingsService,
          Widget child) {
        if (!recordingsService.isWatching) {
          subscribe(recordingsService);
          recordingsService.isWatching = true;
        }
        return ListView.builder(
          itemCount: recordingsService.count,
          itemBuilder: (BuildContext context, int index) {
            final AudioPlayer player = AudioPlayer(playerId: '$index');
            final Recording recording = recordingsService.asList[index];
            player.onPlayerStateChanged.listen((e) {
              recordingsService.toggleStateOf(recording.name);
            });
            return RecordingTile(
              name: recording.name,
              isPlaying: recording.isPlaying,
              onTap: () async {
                if (!recording.isPlaying) {
                  await player.play(recording.url);
                } else {
                  await player.stop();
                }
              },
            );
          },
        );
      },
    );
  }
}
