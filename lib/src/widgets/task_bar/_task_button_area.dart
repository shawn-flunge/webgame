


import 'package:flutter/material.dart';
import 'package:webgame/src/design/borders.dart';

class Program{

  final String name;
  final String icon;

  const Program({
    required this.name,
    required this.icon
  });
}


class TaskButtonArea extends StatelessWidget {
  const TaskButtonArea({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Program> _programs = [
      const Program(name: '내 컴퓨터', icon: 'assets/icons/ic_mycomputer.png')
    ];

    return Expanded(
      child: Row(
        children: List.generate(_programs.length, (index) => _Button(process: _programs[index])),
      ),
    );
  }
}



class _Button extends StatefulWidget {
  // final String title;
  final Program process;

  const _Button({
    super.key,
    required this.process
    // required this.title
  });

  @override
  State<_Button> createState() => _ButtonState();
}

class _ButtonState extends State<_Button> {

  bool _pressed = false;

  @override
  Widget build(BuildContext context) {

    /// todo: 1. tap cancel하는거
    /// todo: 2. 실행 프로그램 많아지면 크기 줄이는거
    return GestureDetector(
      onTapDown: (details){
        setState(() {
          _pressed = true;
        });
      },
      onTapUp: (details){
        // print('${widget.title}, ${details.kind}');
        setState(() {
          _pressed = false;
        });
      },
      child: Container(
        decoration: _pressed //|| manager.front?.name == widget.process.name
            ? negativeBorder.copyWith(color: const Color.fromARGB(255, 214, 214, 214))
            : positiveBorder,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
        margin: const EdgeInsets.only(right: 1),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 4),
              child: Image.asset(
                widget.process.icon,
                width: 20,
              ),
            ),
            Text(
              widget.process.name,
              style: TextStyle(
                  fontFamily: 'gulim',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.values[8],
                  overflow: TextOverflow.fade
              ),
            ),
          ],
        ),
      ),

      // child: Consumer<ProcessManager>(
      //     child: widget.process.icon != null
      //         ? Container(
      //       margin: const EdgeInsets.only(right: 4),
      //       child: Image.asset(
      //         widget.process.icon!,
      //         width: 20,
      //       ),
      //     )
      //         : null,
      //     builder: (context, manager, icon) {
      //       return Container(
      //         decoration: _pressed || manager.front?.name == widget.process.name
      //             ? negativeBorder.copyWith(color: const Color.fromARGB(255, 214, 214, 214))
      //             : positiveBorder,
      //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
      //         margin: const EdgeInsets.only(right: 1),
      //         child: Row(
      //           children: [
      //             if(widget.process.icon != null)
      //               icon!,
      //             Text(
      //               widget.process.name,
      //               style: TextStyle(
      //                   fontFamily: 'gulim',
      //                   fontSize: 15,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.values[8],
      //                   overflow: TextOverflow.fade
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      // ),
    );
  }
}


