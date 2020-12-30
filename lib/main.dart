import 'package:firecorder/screens/authentication_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(FiRecorder());

class FiRecorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FiRecorder',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => AuthenticationScreen(),
      },
    );
  }
}
