import 'package:firecorder/models/audio_file.dart';
import 'package:firecorder/screens/home_screen/action_button.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionsPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(viewHeight(context, 5)),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<AudioFile>(
            builder: (BuildContext context, AudioFile audioFile, Widget child) {
              return ActionButton(
                icon: Icon(
                  audioFile.isRecording
                      ? Icons.stop_outlined
                      : Icons.mic_outlined,
                ),
                onPressed: () {
                  audioFile.toggleState();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
