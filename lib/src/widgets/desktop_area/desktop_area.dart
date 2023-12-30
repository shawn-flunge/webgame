


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webgame/src/data/objects/program.dart';
import 'package:webgame/src/states/process_manager.dart';
import 'package:webgame/src/states/user_behavior_detector.dart';
import 'package:webgame/src/widgets/desktop_area/_shortcut.dart';
import 'package:webgame/src/widgets/desktop_area/_window.dart';

class DesktopArea extends StatelessWidget {
  const DesktopArea({super.key});

  /// todo : 프로그램 목록 불러오는 방법
  static const List<Program> _programs = [
    Program(name: '내 컴퓨터', icon: 'assets/icons/ic_mycomputer.png'),
  ];

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: LayoutBuilder(

        builder: (context, constraints) {
          return Consumer2<ProcessManager, UserBehaviorDetector>(
            builder: (context, manager, detector, child) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapDown: (details){
                  detector.doSomething(Behavior.tap);
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ...List.generate(_programs.length, (index) {

                      return Shortcut(
                        index: index,
                        program: _programs[index],
                      );
                    }),

                    ...List.generate(manager.length, (index) {

                      return Window(
                        program: manager[index],
                        deskTopSize: constraints.biggest,
                      );
                    })
                  ],
                ),
              );
            }
          );
        },
      ),
    );
  }
}
