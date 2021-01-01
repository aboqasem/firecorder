import 'package:firecorder/screens/home_screen/actions_panel.dart';
import 'package:firecorder/screens/home_screen/logout_button.dart';
import 'package:firecorder/screens/home_screen/recordings_list_view.dart';
import 'package:firecorder/screens/home_screen/recordings_panel.dart';
import 'package:firecorder/services/recording_service.dart';
import 'package:firecorder/services/recordings_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecordingsService>(
          create: (BuildContext context) => RecordingsService(),
        ),
        ChangeNotifierProvider<RecordingService>(
          create: (BuildContext context) => RecordingService(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Recordings'),
          actions: [
            LogoutButton(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecordingsPanel(listView: RecordingsListView()),
            ActionsPanel(),
          ],
        ),
      ),
    );
  }
}
