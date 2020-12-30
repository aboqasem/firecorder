import 'dart:math';

import 'package:firecorder/screens/welcome_screen/email_field.dart';
import 'package:firecorder/screens/welcome_screen/login_button.dart';
import 'package:firecorder/screens/welcome_screen/password_field.dart';
import 'package:firecorder/screens/welcome_screen/sign_up_button.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String email;
  String password;

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
            EmailField(
              onChanged: (String text) {
                email = text;
              },
            ),
            SizedBox(height: viewHeight(context, 1)),
            PasswordField(
              onChanged: (String text) {
                password = text;
              },
            ),
            SizedBox(height: viewHeight(context, 5)),
            LoginButton(
              onPressed: () {
                print({"Email": email, "Password": password});
              },
            ),
            SizedBox(height: viewHeight(context, 2.5)),
            SignUpButton(
              onPressed: () {
                print({"Email": email, "Password": password});
              },
            )
          ],
        ),
      ),
    );
  }
}
