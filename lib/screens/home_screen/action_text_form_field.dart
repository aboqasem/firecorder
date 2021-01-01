import 'package:firecorder/utils/helpers.dart';
import 'package:flutter/material.dart';

class ActionTextFormField extends StatelessWidget {
  final String initialValue;
  final void Function(String) onChanged;

  ActionTextFormField({@required this.initialValue, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: initialValue,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          onChanged: onChanged,
          validator: (text) {
            if (text.isEmpty) return 'Please enter a recording name';
            return null;
          },
        ),
        SizedBox(height: viewHeight(context, 3)),
      ],
    );
  }
}
