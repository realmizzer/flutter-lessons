import 'package:flutter/material.dart';
import 'package:flutter_lessons/data/notifiers.dart';
import 'package:flutter_lessons/views/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/logo.webp'),
          ),
          ListTile(
            title: Text('logout'),
            onTap: () {
              selectedPageNotifier.value = 0;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
