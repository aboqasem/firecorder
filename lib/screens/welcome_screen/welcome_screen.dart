import 'dart:math';

import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.graphic_eq,
              size: min(
                viewWidth(context, 50),
                viewHeight(context, 50),
              ),
            ),
            SizedBox(height: viewHeight(context, 5)),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (String text) {},
            ),
            SizedBox(height: viewHeight(context, 1)),
            TextField(
              obscureText: true,
              onChanged: (String text) {},
            ),
            SizedBox(height: viewHeight(context, 5)),
            ElevatedButton(
              child: Text(
                'Login',
                style: TextStyle(fontSize: viewHeight(context, 2)),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  minimumSize:
                      Size(viewWidth(context, 110), viewHeight(context, 5)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
            ),
            SizedBox(height: viewHeight(context, 2.5)),
            OutlinedButton(
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: viewHeight(context, 2)),
              ),
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                minimumSize:
                    Size(viewWidth(context, 100), viewHeight(context, 5)),
                side: BorderSide(width: 2.0, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
