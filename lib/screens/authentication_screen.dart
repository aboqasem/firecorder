import 'package:firecorder/screens/authentication_screen/email_field.dart';
import 'package:firecorder/screens/authentication_screen/login_button.dart';
import 'package:firecorder/screens/authentication_screen/password_field.dart';
import 'package:firecorder/screens/authentication_screen/sign_up_button.dart';
import 'package:firecorder/screens/widgets/logo.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: viewWidth(context, 10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Logo(),
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
