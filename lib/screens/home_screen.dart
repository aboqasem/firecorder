import 'package:firecorder/models/recordings_database.dart';
import 'package:firecorder/screens/home_screen/recordings_list_view.dart';
import 'package:firecorder/screens/home_screen/recordings_panel.dart';
import 'package:firecorder/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => RecordingsDatabase(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Recordings'),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                tooltip: 'Logout',
                onPressed: () async {
                  await _auth.logout();
                },
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RecordingsPanel(listView: RecordingsListView()),
            ],
          ),
        ));
  }
}
