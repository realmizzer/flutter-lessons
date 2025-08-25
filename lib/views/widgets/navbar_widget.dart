// importm
import 'package:flutter/material.dart';
import 'package:flutter_lessons/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            NavigationDestination(
              icon: Icon(Icons.fullscreen_exit),
              label: 'FlexTest',
            ),
             NavigationDestination(
              icon: Icon(Icons.network_check),
              label: 'Networking',
            ),
          ],
          onDestinationSelected: (value) {
            print("selected desintation is $value");
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
