import 'package:firecorder/screens/authentication_screen/email_field.dart';
import 'package:firecorder/screens/authentication_screen/login_button.dart';
import 'package:firecorder/screens/authentication_screen/password_field.dart';
import 'package:firecorder/screens/authentication_screen/sign_up_button.dart';
import 'package:firecorder/screens/authentication_screen/error_text.dart';
import 'package:firecorder/screens/widgets/logo.dart';
import 'package:firecorder/services/auth_service.dart';
import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  AuthService _auth = AuthService();
  String _email = '';
  String _password = '';
  String _error = '';

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
                _email = text;
              },
            ),
            SizedBox(height: viewHeight(context, 1)),
            PasswordField(
              onChanged: (String text) {
                _password = text;
              },
            ),
            SizedBox(height: viewHeight(context, 1)),
            ErrorText(text: _error),
            SizedBox(height: viewHeight(context, 5)),
            LoginButton(
              onPressed: () async {
                try {
                  await _auth.login(email: _email, password: _password);
                } catch (e) {
                  setState(() {
                    _error = e;
                  });
                }
              },
            ),
            SizedBox(height: viewHeight(context, 2.5)),
            SignUpButton(
              onPressed: () async {
                try {
                  await _auth.signUp(email: _email, password: _password);
                } catch (e) {
                  setState(() {
                    _error = e;
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
