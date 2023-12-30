


import 'package:flutter/material.dart';
import 'package:webgame/src/data/objects/program.dart';
import 'package:webgame/src/widgets/desktop_area/_shortcut.dart';

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
          return GestureDetector(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ...List.generate(_programs.length, (index) {

                  return Shortcut(
                    index: index,
                    program: _programs[index],
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
