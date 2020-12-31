import 'package:flutter/material.dart';

class RecordingTile extends StatelessWidget {
  final String name;
  final bool isPlaying;
  final void Function() onTap;

  RecordingTile({
    @required this.name,
    @required this.isPlaying,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(name),
        trailing: isPlaying ? Icon(Icons.pause, color: Colors.black) : null,
        onTap: onTap,
      ),
      Divider(),
    ]);
  }
}
