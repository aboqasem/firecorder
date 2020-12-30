import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final void Function(String) onChanged;

  EmailField({@required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: onChanged,
      decoration: InputDecoration(hintText: 'Email'),
    );
  }
}
