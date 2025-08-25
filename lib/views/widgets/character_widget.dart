import 'package:flutter/material.dart';
import 'package:flutter_lessons/data/classes/character.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({super.key, this.character});

  final Character? character;

  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: [Text(character?.name ?? '')]));
  }
}
