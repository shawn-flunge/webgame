


import 'package:flutter/material.dart';
import 'package:webgame/src/design/colors.dart';
import 'package:webgame/src/widgets/desktop_area/desktop_area.dart';
import 'package:webgame/src/widgets/task_bar/task_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.desktopGreen,
      body: Column(
        children: [
          DesktopArea(),
          TaskBar()
        ],
      ),
    );
  }
}
