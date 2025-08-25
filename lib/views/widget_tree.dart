import 'package:flutter/material.dart';
import 'package:flutter_lessons/data/constants.dart';
import 'package:flutter_lessons/data/notifiers.dart';
import 'package:flutter_lessons/views/pages/expanded_flexible_test.dart';
import 'package:flutter_lessons/views/pages/home_page.dart';
import 'package:flutter_lessons/views/pages/network_test_page.dart';
import 'package:flutter_lessons/views/pages/profile_page.dart';
import 'package:flutter_lessons/views/pages/settings_page.dart';
import 'package:flutter_lessons/views/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
  ExpandedFlexibleTest(),
  NetworkTestPage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Lessons'),
        centerTitle: true,
        // leading: Icon(Icons.join_full), // doesnt work with drawer
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkMode, child) {
              return IconButton(
                onPressed: () async {
                  isDarkModeNotifier.value = !isDarkModeNotifier.value;
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool(
                    KConstants.isDarkKey,
                    isDarkModeNotifier.value,
                  );
                },
                icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              );
            },
          ),
          IconButton(
            onPressed: () {
              // there is pushReplacement as well
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: 'Settings');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        backgroundColor: Colors.teal,
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              // DrawerHeader(child: Text('List')),
              ListTile(title: Text('logout')),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          FloatingActionButton(
            heroTag: 'plus',
            onPressed: () {
              print('floating action button has been pressed');
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'minus',
            onPressed: () {
              print('floating action button has been pressed');
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
