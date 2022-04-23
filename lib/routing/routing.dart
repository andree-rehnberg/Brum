import 'package:brum/home/home.dart';
import 'package:brum/login/login.dart';
import 'package:brum/services/auth.dart';
import 'package:brum/shared/loading.dart';
import 'package:flutter/material.dart';

class RoutingScreen extends StatelessWidget {
  const RoutingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          var user = AuthService().user;

          List whitelist = [
            'andree.rehnberg@gmail.com',
            'idaellinorbryngelsson@gmail.com',
            'rich.norling@gmail.com',
            'annikasandells@gmail.com'
          ];

          if (!whitelist.contains(user!.email)) {
            AuthService().signOut();
            return const LoginScreen(
              isInvalidUser: true,
            );
          }

          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
