import 'package:firecorder/services/auth_service.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.logout),
      tooltip: 'Logout',
      onPressed: () async {
        await AuthService().logout();
      },
    );
  }
}
