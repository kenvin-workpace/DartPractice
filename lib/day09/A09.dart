import 'mystorage.dart';

/*
 * 自定义库
 */
void test_1() {
  printPi();
  printTool();
  printUtil();
}

/*
 * 泛型可以减少代码重复，也可以创建多类型共享的接口，同时还能在检查模式早期预警，比如创建一个接口缓存对象
 */
abstract class ObjectCache<T> {
  T getBykey(String key);

  void setKey(String key, T value);
}

class InstanceClass extends ObjectCache<String> {

  Map<String, Object> maps = new Map();


  @override
  void setKey(String key, String value) {
    maps.putIfAbsent(key, () => value);
  }

  @override
  String getBykey(String key) {
    maps[key];
  }

}

void test_2() {
  InstanceClass ic = new InstanceClass();
  ic.setKey("name", "hongzhen");

  String name = ic.getBykey("name");
  print(name);
}

/*
 * 异常 Throw
 */
void test_3() {
  // 抛出一个异常
  //throw new FormatException("Expected at least 1 section");

  // 抛出任意异常对象
  throw "Out of llamas";
}

/*
 * 异常 Catch
 */
void test_4() {
  int a = 1,
      b = 0,
      c = 0;
  try {
    c = a ~/ b;
  } on IntegerDivisionByZeroException {
    //指定的异常
    print("IntegerDivisionByZeroException");
  } on Exception catch (e) {
    //所有异常
    print("exception catch: $e");
  } catch (e) {
    //没有指定类型,处理所有异常
    print("exception: $e");
  }
}

void test_5() {
  int a = 1,
      b = 0,
      c = 0;
  try {
    c = a ~/ b;
  } on FormatException {
    //指定的异常
    print("IntegerDivisionByZeroException");
  } on Exception catch (e) {
    //所有异常
    print("exception catch: $e");
  } catch (e) {
    //没有指定类型,处理所有异常
    print("exception: $e");
  }
}

/*
 * 异常 Finally
 */
void test_6() {
  int a = 1,
      b = 0,
      c = 0;
  try {
    c = a ~/ b;
  } on IntegerDivisionByZeroException {
    //首先处理异常
    print("exception: IntegerDivisionByZeroException");
  } finally {
    //最终必定执行
    print("finally end");
  }
}

main() {
  test_6();
}