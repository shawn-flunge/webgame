




import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webgame/src/design/borders.dart';

class UtilityArea extends StatefulWidget {
  const UtilityArea({super.key});

  @override
  State<UtilityArea> createState() => _UtilityAreaState();
}

class _UtilityAreaState extends State<UtilityArea> {

  late Timer _timer;
  late String _now;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _translate();
    });
  }


  @override
  void didChangeDependencies() {
    _translate();
  }

  _translate(){
    final now = DateTime.now();

    final evening = now.hour > 12 ? '오후' : '오전';
    final hour = now.hour > 12 ? now.hour-12 : now.hour;
    final minute = now.minute < 10 ? '0${now.minute}' : now.minute;
    setState(() {
      _now = '$evening $hour:$minute';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: negativeBorder,
      child: Text(
        _now,
        style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.values[8]
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
