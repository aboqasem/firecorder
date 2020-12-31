import 'package:firebase_core/firebase_core.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
            Icon(
              Icons.graphic_eq,
              size: viewWidth(context, 50),
            ),
            SizedBox(
              height: viewHeight(context, 10),
            ),
            _isLoading
                ? SpinKitCircle(
                    color: Colors.black,
                    size: viewHeight(context, 5),
                  )
                : _isError
                    ? Text(
                        'An error occurred while initializing the app.',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: viewHeight(context, 2),
                        ),
                      )
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
