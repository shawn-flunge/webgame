

import 'package:flutter/material.dart';
import 'package:webgame/src/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// todo: title
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'gulim',
      ),
      home: const HomePage(),
    );
  }
}
