import 'package:flutter/material.dart';

import '../services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Profil'),
            ElevatedButton(
              onPressed: () => AuthService().signOut(),
              child: const Text('Logga ut'),
            )
          ],
        ),
      ),
    );
  }
}
