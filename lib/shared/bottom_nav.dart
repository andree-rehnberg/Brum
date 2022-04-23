import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Colors.blue[700],
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
          icon: const SizedBox(
            child: Icon(
              FontAwesomeIcons.car,
            ),
            width: 38,
            height: 38,
          ),
          label: 'Bokningar',
          backgroundColor: Colors.blue[700],
          activeIcon: const SizedBox(
            child: Icon(
              FontAwesomeIcons.carCrash,
            ),
            width: 38,
            height: 38,
          ),
        ),
        BottomNavigationBarItem(
          icon: const SizedBox(
            child: Icon(
              FontAwesomeIcons.stickyNote,
            ),
            width: 38,
            height: 38,
          ),
          label: 'Anteckningar',
          backgroundColor: Colors.blue[700],
          activeIcon: const SizedBox(
            child: Icon(
              FontAwesomeIcons.solidStickyNote,
            ),
            width: 38,
            height: 38,
          ),
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            child: GoogleProfilePicture(url: user!.photoURL!),
            width: 38,
            height: 38,
          ),
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
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
