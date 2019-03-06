/*
 * 规范语法
 */
void test_1(String name) {
  print("My name is $name.");
}

/*
 * 通俗语法
 */
test_2(name) {
  print("My name is $name.");
}

/*
 * 速写语法
 */
test_3(name) => print("My name is $name.");

/*
 * 命名参数
 * 用 { } 把参数包装起来，就能标识命名参数
 * 用 : 指定默认值
 */
test_4({String name, int age, String sex: "female"}) {
  print("My name is $name,$age years old,gender $sex");

  //test_4(name: "wanghz", age: 10);
  //test_4(name: "wanghz", age: 11, sex: "man");
}

/*
 * 位置参数
 * 用 [ ] 把参数包装起来，就能标识位置参数
 * 用 = 指定默认值
 */
test_5(String name, String msg, [String device, String mood = "good"]) {
  String result = "$name says $msg";
  if (device != null) {
    result = "$result with a $device";
  }
  if (mood != null) {
    result = "$result ( in a $mood mood)";
  }
  print(result);

  //test_5("wanghz", "sun");
  //test_5("wanghz", "sun", "smoke signal");
  //test_5("wanghz", "sun", "somke signal", "bad");
}

/*
 * 高阶函数
 * 将函数作为参数传递给另一个函数
 */
test_6(item) {
  print(item);
}

test_7() {
  List lists = [1, 2, 3, 4, "a", "b", "c"];
  lists.forEach(test_6);
}

/*
 * 高阶函数
 * 将一个函数分配给一个变量
 */
test_8() {
  var method = (msg) => "!!!${msg.toUpperCase()}!!";
  print(method("hello"));
}

/*
 * 闭包
 * dart的闭包就是函数对象，其实跟JavaScript的闭包函数差不多，理论请参考JavaScript的闭包函数
 */
Function test_9(int addby) {
  return (int i) => addby + i;
}

test_10() {
  Function add2 = test_9(2);
  Function add3 = test_9(3);

  // 2 + 3 = 5
  print(add2(3));
  // 3 + 3 = 6
  print(add3(3));
}

/*
 * 函数判断
 */
foo() {}

class SomeClass {
  // 一个静态方法
  static void bar() {}

  // 一个实例方法
  void baz() {}
}

test_11() {
  var x;
  // 比较高阶函数
  x = foo;
  print(x == foo);

  // 比较静态方法
  x = SomeClass.bar;
  print(x == SomeClass.bar);

  // 比较实例方法
  var v = new SomeClass();
  var w = new SomeClass();
  var y = w;
  x = w.baz;
  print(y.baz == x);
  print(v.baz != w.baz);
}


test_() {

}

main(List<String> arguments) {
  test_11();
}