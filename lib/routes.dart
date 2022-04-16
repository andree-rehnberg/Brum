import 'package:brum/home/home.dart';
import 'package:brum/login/login.dart';
import 'package:brum/notes/notes.dart';
import 'package:brum/profile/profile.dart';
import 'package:brum/routing/routing.dart';

var appRoutes = {
  '/': (context) => const RoutingScreen(),
  '/home': (context) => const HomeScreen(),
  '/notes': (context) => const NotesScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/login': (context) => const LoginScreen(),
};
