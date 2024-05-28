import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text(style: TextStyle(color: Colors.white), 'Menu'),
          ),
          ListTile(
            title: const Text(style: TextStyle(color: Colors.white), 'Inicio'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title:
                const Text(style: TextStyle(color: Colors.white), 'Calendário'),
            onTap: () {
              Navigator.pushNamed(context, '/calendario');
            },
          ),
          ListTile(
            title: const Text(
                style: TextStyle(color: Colors.white), 'Informações'),
            onTap: () {
              Navigator.pushNamed(context, '/info');
            },
          ),
        ],
      ),
    );
  }
}
