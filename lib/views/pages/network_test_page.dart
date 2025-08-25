import 'package:flutter/material.dart';
import 'package:flutter_lessons/data/classes/character.dart';
import 'package:flutter_lessons/views/widgets/character_widget.dart';
import 'dart:async';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NetworkTestPage extends StatefulWidget {
  const NetworkTestPage({super.key});

  @override
  State<NetworkTestPage> createState() => _NetworkTestPageState();
}

class _NetworkTestPageState extends State<NetworkTestPage> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.https('rickandmortyapi.com', '/api/character/2');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Character.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            Character character = snapshot.data;
            return SingleChildScrollView(
              child: CharacterWidget(character: character),
            );
          } else {
            return Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
