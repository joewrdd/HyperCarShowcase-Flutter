import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;

  const MainDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 170,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.notes,
            ),
            title: Text(
              'About Us',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 18),
            ),
            onTap: () {
              onSelectScreen('aboutus');
            },
            splashColor: Theme.of(context).colorScheme.onSurface,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 18),
            ),
            onTap: () {
              onSelectScreen('logout');
            },
            splashColor: Theme.of(context).colorScheme.onSurface,
          ),
        ],
      ),
    );
  }
}
