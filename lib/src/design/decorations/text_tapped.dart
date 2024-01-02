
import 'package:flutter/material.dart';
import 'package:webgame/src/design/colors.dart';


class TextTappedDecoration extends Decoration{

  const TextTappedDecoration();

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return const _TextTappedPainter();
  }
}

class _TextTappedPainter extends BoxPainter{

  const _TextTappedPainter();

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Size size = configuration.size ?? const Size(0, 0);

    final rect = Rect.fromLTRB(offset.dx, offset.dy, offset.dx+size.width, offset.dy+size.height);

    final path = Path()..addRect(rect);
    final paint = Paint()
      ..color=const Color.fromARGB(125, 6, 0, 111);
    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = AppColors.darkGrey..style=PaintingStyle.stroke..strokeWidth=1;
    final dottedPath = Path();

    for(final metric in path.computeMetrics()){
      double start = 0;

      while (start < metric.length) {
        double end = start + 1;
        dottedPath.addPath(metric.extractPath(start, end), Offset.zero);
        start = end + 3;
      }
    }

    canvas.drawPath(dottedPath, paint2);
  }
}

