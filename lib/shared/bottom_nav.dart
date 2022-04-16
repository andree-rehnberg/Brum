import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brum/home/home.dart';

import '../services/auth.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function onItemTapped;
  const BottomNavBar(
      {Key? key, required this.selectedIndex, required this.onItemTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;

    return BottomNavigationBar(
      fixedColor: Colors.white,
      selectedLabelStyle: const TextStyle(
        color: Colors.black,
      ),
      unselectedItemColor: Colors.blueGrey[200],
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            FontAwesomeIcons.car,
            size: 20,
          ),
          label: 'Bokningar',
          backgroundColor: Colors.blue[700],
          activeIcon: const Icon(
            FontAwesomeIcons.carCrash,
          ),
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            FontAwesomeIcons.stickyNote,
            size: 20,
          ),
          label: 'Anteckningar',
          backgroundColor: Colors.blue[700],
          activeIcon: const Icon(
            FontAwesomeIcons.solidStickyNote,
          ),
        ),
        BottomNavigationBarItem(
          icon: GoogleProfilePicture(url: user!.photoURL!),
          label: 'Profil',
          backgroundColor: Colors.blue[700],
        ),
      ],
      onTap: (int idx) {
        if (selectedIndex != idx) onItemTapped(idx);
      },
    );
  }
}

class GoogleProfilePicture extends StatelessWidget {
  final String url;
  const GoogleProfilePicture({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
