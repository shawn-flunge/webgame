


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:webgame/src/data/objects/program.dart';
import 'package:webgame/src/states/process_manager.dart';
import 'package:webgame/src/widgets/window_theme_button.dart';

class Window extends StatefulWidget {
  final Program program;
  final Size deskTopSize;

  const Window({
    super.key,
    required this.program,
    required this.deskTopSize
  });

  @override
  State<Window> createState() => _WindowState();
}

class _WindowState extends State<Window> {

  Offset _position = const Offset(50, 50);
  Size _size = const Size(400, 300);

  bool _isFullSize = false;
  Size _beforeFull = const Size(400, 300);
  Offset? _last;

  MouseCursor _cursor = SystemMouseCursors.basic;
  bool _resizeMode = false;
  bool _left=false,_right=false,_top=false,_bottom=false;

  @override
  void initState() {
    super.initState();
    // final SocketManager manager = SocketManager();
    // manager.roomCreate();
  }

  void resizeHandler(PointerHoverEvent event){
    _resizeMode = true;

    // if(event.localPosition.dx<3 || event.localPosition.dx>_size.width-3){
    //   setState(() {
    //     _cursor = SystemMouseCursors.resizeLeftRight;
    //   });
    //
    // } else if(event.localPosition.dy <3 || event.localPosition.dy>_size.height-3){
    //   setState(() {
    //     _cursor = SystemMouseCursors.resizeUpDown;
    //   });
    // } else {
    //   _resizeMode = false;
    //   setState(() {
    //     _cursor = SystemMouseCursors.basic;
    //   });
    // }
    if(event.localPosition.dx<5){
      _left = true;

      setState(() {
        _cursor = SystemMouseCursors.resizeLeftRight;
      });
    } else if(event.localPosition.dx>_size.width-5){
      _right=true;
      // print('right');
      setState(() {
        _cursor = SystemMouseCursors.resizeLeftRight;
      });
    } else {
      _left=false;
      _right=false;
    }

    if(event.localPosition.dy <5){
      _top=true;
      setState(() {
        _cursor = SystemMouseCursors.resizeUpDown;
      });
    } else if(event.localPosition.dy>_size.height-5){
      _bottom=true;
      setState(() {
        _cursor = SystemMouseCursors.resizeUpDown;
      });
    } else {
      _top=false;
      _bottom=false;
    }

    if((_left || _right || _top || _bottom) == false) {
      _resizeMode = false;
      setState(() {
        _cursor = SystemMouseCursors.basic;
      });
    }
  }

  void resizeWindow(DragUpdateDetails details){
    if(!_resizeMode) return;
    // if(_size.width < 240) {
    //   print('small $_size');
    //   return;
    // }
    // print('${details.localPosition}, ${details.localPosition-Offset(_size.width, _size.height)}');
    setState(() {
      // math.abs()
      _size += details.localPosition-Offset(_size.width, _size.height);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: MouseRegion(
        cursor: _cursor,
        onHover: resizeHandler,
        child: GestureDetector(
          // onTapDown: (details){
          //   if(!_resizeMode) return;
          //   print(details.localPosition);
          // },
          onPanUpdate: resizeWindow,
          child: Container(
            width: _size.width,
            height: _size.height,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 179, 179, 179),
                border: Border(
                  top: BorderSide(
                      color: Colors.white,
                      width: 2
                  ),
                  left: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  right: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                )
            ),
            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  margin: const EdgeInsets.all(2),
                  color: const Color.fromARGB(255, 0, 0, 109),
                  child: Row(
                    children: [

                      Expanded(
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onPanStart: (details){
                            _last = details.localPosition;
                          },
                          onPanUpdate: (details){
                            // print(details.localPosition);
                            if(_last == null) return;

                            setState(() {
                              _position += details.localPosition-_last!;
                            });
                            _last = details.localPosition;
                          },
                          onDoubleTap: (){
                            if(_isFullSize){
                              setState(() {
                                _position = const Offset(50, 50);
                                _size = _beforeFull;
                              });
                            } else{
                              _beforeFull = _size;
                              setState(() {
                                _size = widget.deskTopSize;
                                _position = Offset.zero;
                              });
                            }
                            _isFullSize = !_isFullSize;
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                widget.program.icon,
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(width: 4,),
                              Text(
                                widget.program.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      WindowsThemeButton(
                        type: DefaultType.minimum,
                        onClick: (){
                          final manager = context.read<ProcessManager>();
                          manager.hide(widget.program.name);

                        },
                      ),
                      WindowsThemeButton(
                        type: DefaultType.maximum,
                        onClick: (){

                          setState(() {
                            _size = widget.deskTopSize;
                            _position = Offset.zero;
                          });
                        },
                      ),
                      WindowsThemeButton(
                        type: DefaultType.close,
                        onClick: (){
                          final manager = context.read<ProcessManager>();
                          manager.close(widget.program.name);

                        },
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

