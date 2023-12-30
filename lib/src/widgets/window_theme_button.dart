



import 'package:flutter/material.dart';
import 'package:webgame/src/design/borders.dart';

class WindowsThemeButton extends StatefulWidget {

  final void Function() onClick;
  final DefaultType? type;
  final Widget? child;

  const WindowsThemeButton({
    super.key,
    required this.onClick,
    this.type,
    this.child,
  });

  @override
  State<WindowsThemeButton> createState() => _WindowsThemeButtonState();
}

class _WindowsThemeButtonState extends State<WindowsThemeButton> {

  bool _pressed = false;

  Widget _defaultButton(){
    return CustomPaint(
      size: const Size(15,15),
      painter: widget.type!.painter,
    );
  }

  @override
  Widget build(BuildContext context) {
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
        onTap: widget.onClick,
        child: Container(
          decoration: _pressed
              ? negativeBorder.copyWith(color: const Color.fromARGB(255, 214, 214, 214))
              : positiveBorder,
          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
          margin: const EdgeInsets.only(right: 1),
          child: widget.child ?? _defaultButton(),
        )
    );
  }
}

enum DefaultType{
  close(_Close()),
  maximum(_Maximum()),
  minimum(_Minimum());

  final CustomPainter painter;

  const DefaultType(this.painter);
}


abstract class _ButtonTypePainter extends CustomPainter{

  final bool disabled;
  double get padding => 2.2;

  const _ButtonTypePainter({
    this.disabled=false
  });

  (Path path, Paint? paint) drawPath(Canvas canvas, Size size);

  @override
  void paint(Canvas canvas, Size size) {

    final defaultPaint = Paint()
      ..color=Colors.black
      ..style=PaintingStyle.stroke
      ..strokeWidth=2.4;

    final (path, paint) = drawPath(canvas, size);
    canvas.drawPath(path, paint ?? defaultPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Close extends _ButtonTypePainter{
  const _Close({super.disabled});

  @override
  (Path, Paint?) drawPath(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(padding, padding)
      ..lineTo(size.width-padding, size.height-padding)
      ..moveTo(size.width-padding, padding)
      ..lineTo(padding, size.height-padding);
    return (path, null);
  }

}


class _Maximum extends _ButtonTypePainter{

  const _Maximum({super.disabled});

  @override
  (Path, Paint?) drawPath(Canvas canvas, Size size) {

    final paint = Paint()..strokeWidth=1;

    final topPath = Path()
      ..addRect(
          Rect.fromLTRB(padding, padding, size.width-padding, 4.5)
      );

    canvas.drawPath(topPath, paint);

    final path = Path()
      ..moveTo(padding, padding)
      ..lineTo(size.width-padding, padding)
      ..lineTo(size.width-padding, size.height-padding)
      ..lineTo(padding, size.height-padding)
      ..lineTo(padding, padding);

    paint.style = PaintingStyle.stroke;
    return (path, paint);
  }
}

class _Minimum extends _ButtonTypePainter{

  const _Minimum({super.disabled});

  @override
  (Path, Paint?) drawPath(Canvas canvas, Size size) {
    const under = 3.8;
    final path = Path()
      ..moveTo(size.width/2-under, size.height-padding)
      ..lineTo(size.width/2+under, size.height-padding);
    return (path, null);
  }
}