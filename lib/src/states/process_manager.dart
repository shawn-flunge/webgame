




import 'package:flutter/material.dart';
import 'package:webgame/src/data/objects/program.dart';

class ProcessManager extends ChangeNotifier{

  final List<Program> programs = [];

  Program? front;

  void run(Program program){
    final has = programs.indexWhere((element) => element.name == program.name);

    if(has != -1){
      programs[has].visible = true;
      front = programs[has];

    } else {
      programs.add(program);
      front = program;
    }
    notifyListeners();
  }

  void hide(Program program){
    front = null;
    final has = programs.indexWhere((element) => element.name == program.name);

    if(has != -1){
      programs[has].visible = false;
      notifyListeners();
    }
  }

  void close(String name){
    final index = programs.indexWhere((element) => element.name == name);

    if(index == -1) return;

    programs.removeAt(index);
    if(programs.isEmpty) {
      front = null;
    } else {
      front = programs[index-1];
    }
    notifyListeners();
  }

  bool visible(Program program){
    final index = programs.indexWhere((element) => element.name == program.name);
    if(index == -1){
      return false;
    } else {
      return programs[index].visible;
    }
  }

  Program operator [](int i) => programs[i];
  int get length => programs.length;

}

