import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webgame/src/app.dart';
import 'package:webgame/src/states/process_manager.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProcessManager(),),
      ],
      child: const App(),
    )
  );
}