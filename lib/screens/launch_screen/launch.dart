import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecorder/screens/authentication_screen.dart';
import 'package:firecorder/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Launch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    if (user == null) return AuthenticationScreen();
    return HomeScreen();
  }
}
