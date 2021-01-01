import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firecorder/screens/widgets/error_text.dart';
import 'package:firecorder/screens/launch_screen/launch.dart';
import 'package:firecorder/screens/widgets/loading_spinner.dart';
import 'package:firecorder/screens/widgets/logo.dart';
import 'package:firecorder/services/auth_service.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool _isLoading = true, _isError = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) {
          return StreamProvider<User>.value(
            value: AuthService().userStream,
            child: Launch(),
          );
        },
      ));
    } catch (e) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(height: viewHeight(context, 10)),
            _isLoading
                ? LoadingSpinner()
                : _isError
                    ? ErrorText('An error occurred while initializing the app.')
                    : null,
          ],
        ),
      ),
    );
  }
}
