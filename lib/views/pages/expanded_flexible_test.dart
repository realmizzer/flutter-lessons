import 'package:flutter/material.dart';

class ExpandedFlexibleTest extends StatelessWidget {
  const ExpandedFlexibleTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Container(color: Colors.teal)),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
            child: Text(
              'it shrinks by text, because this is a flexible widget',
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(color: Colors.red, height: 100.0),
            ),
            Expanded(
              flex: 2,
              child: Container(color: Colors.blueAccent, height: 100.0),
            ),
          ],
        ),
      ],
    );
  }
}
