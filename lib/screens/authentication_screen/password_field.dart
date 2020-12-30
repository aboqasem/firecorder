import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final void Function(String) onChanged;

  PasswordField({@required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(hintText: 'Password'),
    );
  }
}
