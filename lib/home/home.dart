import 'package:brum/calendar/calendar.dart';
import 'package:brum/notes/notes.dart';
import 'package:brum/profile/profile.dart';
import 'package:brum/services/auth.dart';
import 'package:brum/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _screens = [
    {
      "appBar": AppBar(
        title: const Text("Brum"),
      ),
      "body": const CalendarScreen(),
      "floatingActionButton": FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: const FaIcon(FontAwesomeIcons.calendarPlus, size: 22),
      ),
    },
    {
      "appBar": AppBar(
        title: const Text("Brum"),
      ),
      "body": const NotesScreen(),
      "floatingActionButton": FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        // child: Icon(Icons.add),
        child: const FaIcon(FontAwesomeIcons.stickyNote, size: 22),
      ),
    },
    {
      "appBar": AppBar(
        title: const Text("Brum"),
      ),
      "body": const ProfileScreen(),
      "floatingActionButton": FloatingActionButton(
        onPressed: () => AuthService().signOut(),
        backgroundColor: Colors.red[400],
        child: const Icon(Icons.logout),
      ),
    },
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // appBar: _screens[_selectedIndex]["appBar"],
        body: _screens[_selectedIndex]["body"],
        bottomNavigationBar: BottomNavBar(
          onItemTapped: _onItemTapped,
          selectedIndex: _selectedIndex,
        ),
        floatingActionButton: _screens[_selectedIndex]["floatingActionButton"],
      ),
    );
  }
}
