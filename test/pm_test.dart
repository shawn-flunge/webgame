

import 'package:flutter_test/flutter_test.dart';
import 'package:webgame/src/data/objects/program.dart';
import 'package:webgame/src/states/process_manager.dart';

void main(){

  group('Process Manager Test', () {
    final manager = ProcessManager();

    const program1 = Program(name: 'p1', icon: 'path');
    const program2 = Program(name: 'p2', icon: 'path');

    test('a new added program should be the value "front"', () {

      manager.run(program1);
      expect(manager.front!.name, program1.name);
      manager.run(program2);
      expect(manager.front!.name, program2.name);
    });

    test('if user closes window, "front" must be next value in the list or null when list is empty.', () {

      manager.close('p2');
      expect(manager.front!.name, program1.name);
      manager.close('p1');
      expect(manager.front?.name, null);
    });
    
  });

}