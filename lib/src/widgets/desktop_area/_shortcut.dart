
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webgame/src/data/objects/program.dart';
import 'package:webgame/src/states/process_manager.dart';
import 'package:webgame/src/states/user_behavior_detector.dart';

class Shortcut extends StatefulWidget {
  final int index;
  final Program program;
  const Shortcut({
    super.key,
    required this.index,
    required this.program
  });

  @override
  State<Shortcut> createState() => _ShortcutState();
}

class _ShortcutState extends State<Shortcut> {

  bool _tapped = false;
  /// 1. tap과 doubleTap을 같이쓰면 tap의 반응이 느림
  /// 2. 바탕화면에서 오는 이벤트와 겹치기때문에 _valid를 이용해 조절
  Timer? _timer;
  bool _valid = false;

  late final UserBehaviorDetector detector;
  late final ProcessManager manager;
  late final StreamSubscription userBehavior;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    manager = context.read();
    detector = context.read();

    userBehavior = detector.stream.listen((event) {
      if(_valid) return;
      setState(() {
        _tapped = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10+100.0*widget.index,
      child: GestureDetector(
          onTap: (){
            if(_tapped){

              if(_valid){
                /// 프로그램 실행
                manager.run(widget.program);
              }
              setState(() {
                _tapped = false;
              });
            } else{

              setState(() {
                _tapped = true;
              });

              _valid = true;
              _timer = Timer(const Duration(milliseconds: 250,), (){
                _valid = false;
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/ic_mycomputer.png',
                  color: _tapped ? const Color.fromARGB(125, 6, 0, 111): null,
                  colorBlendMode: BlendMode.srcATop,
                ),
                const SizedBox(height: 2,),
                Container(
                  color: _tapped ? const Color.fromARGB(125, 6, 0, 111): null,
                  /// todo: dotted line
                  child: const Text(
                    '내 컴퓨터',
                    style: TextStyle(
                      color: Color.fromARGB(255, 209, 230, 230),
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
