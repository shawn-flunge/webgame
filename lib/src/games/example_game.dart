


import 'package:flutter/material.dart';

class ExampleGame extends StatefulWidget {
  const ExampleGame({super.key});

  @override
  State<ExampleGame> createState() => _ExampleGameState();
}

class _ExampleGameState extends State<ExampleGame> {
  @override
  Widget build(BuildContext context) {
    print('sdfs');
    return Expanded(
      child: Container(

        margin: const EdgeInsets.all(5),
        color: Colors.red,
        width: double.infinity,
        child: Text(
          'fsdf'
        ),
      ),
    );
  }
}
