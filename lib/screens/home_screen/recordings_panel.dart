import 'package:firecorder/screens/home_screen/recordings_list_view.dart';
import 'package:flutter/material.dart';

class RecordingsPanel extends StatelessWidget {
  final RecordingsListView listView;

  RecordingsPanel({@required this.listView});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: listView,
      ),
    );
  }
}
