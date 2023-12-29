


import 'package:flutter/material.dart';
import 'package:webgame/src/design/borders.dart';
import 'package:webgame/src/design/colors.dart';

class StartMenu extends StatelessWidget {
  const StartMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: positiveBorder,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/ic_windows_start.png',
              width: 24,
            ),
            const SizedBox(width: 3,),
            Text(
              '시작',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.values[8]
                // fontWeight: FontWeight.values[6]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
