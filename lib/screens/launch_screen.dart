import 'package:firebase_core/firebase_core.dart';
import 'package:firecorder/screens/launch_screen/error_text.dart';
import 'package:firecorder/screens/launch_screen/loading_spinner.dart';
import 'package:firecorder/screens/widgets/logo.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool _isLoading = true, _isError = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _isLoading = false;
      });
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
                    ? ErrorText()
                    : Text(
                        'Initialized.',
                        style: TextStyle(
                          fontSize: viewHeight(context, 2),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
