


import 'package:flutter/material.dart';
import 'package:webgame/src/widgets/task_bar/_start_menu.dart';
import 'package:webgame/src/widgets/task_bar/_task_button_area.dart';
import 'package:webgame/src/widgets/task_bar/_utility_area.dart';

class TaskBar extends StatelessWidget {
  const TaskBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // height: 50,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 179, 179, 179),
            border: Border(
                top: BorderSide(
                  width: 2,
                  color: Colors.white,
                )
            )
        ),
        child: const Row(
          children: [
            StartMenu(),
            TaskButtonArea(),
            UtilityArea()
          ],
        ),
      ),
    );
  }
}
