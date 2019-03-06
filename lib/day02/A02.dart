import 'Lib1.dart';
import 'Lib2.dart' as lib2;
import 'Lib3.dart' show func_2;
import 'Lib4.dart' hide func_22;
import 'Lib5.dart' deferred as lib5deferred;

main() {
  int result_1 = add(1, 2);
  print(result_1);

  int result_2 = lib2.min(2, 1);
  print(result_2);

  func_2(2);
  func_33(33);

  lib5deferred.func_deferred(44);
}