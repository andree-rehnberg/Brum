// ignore_for_file: unnecessary_const

import 'package:brum/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';

class LoginScreen extends StatelessWidget {
  final bool isInvalidUser;
  const LoginScreen({Key? key, this.isInvalidUser = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Den mailen kommer du inte in med du!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );

    if (isInvalidUser) {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/busen.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const FlutterLogo(
                size: 150,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                AuthService().signInWithGoogle();
              },
              icon: const FaIcon(
                FontAwesomeIcons.google,
                size: 20,
              ),
              label: const Text(
                'Logga in',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
