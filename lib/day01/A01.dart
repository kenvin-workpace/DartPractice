test_1(int num) {
  print("the number is $num");

  //test_1(10);
}

test_2() {
  var name = "hongzhenw";
  print(name);
  print("my name is $name");

  int a = 10,
      b = 20;
  print("$a+$b=${a + b}");
}

/*
 * 变量定义
 */
test_3() {
  var a = 1;
  int b = 2;
  String c = "hello";
  dynamic d = 3;

  print("a=$a,b=$b,c=$c,d=$d");
}

/*
 * 内建数据类型
 */
test_4() {
  //numbers
  var a = 1;
  int b = 2;
  double c = 3.0;

  print("a=$a,b=$b,c=$c");

  //strings
  var d = "hello";
  String e = "world";

  print("$d $e");

  //booleans
  var f = true;
  bool g = false;

  print("$f $g");

  //lists
  var h = [1, 2, 3, 4, 5];
  List<String> i = ["1", "2", "3", "4", "5"];
  List<dynamic> j = [1, "2", 3, "4", 5.0];

  print("$h = $i = $j");

  //maps
  var k = new Map();
  k["age"] = 1;
  k["name"] = "hongzhenw";

  print("$k");

  //runes
  var l = '\u{1f44f}';
  print("$l");

  //sysbols
  print(#m == new Symbol("m"));
}

/*
 * 函数的返回值
 */
int add_1(int a, int b) {
  return a + b;
}

add_2(int a, int b) {
  return a + b;
}

add_3(int a, int b) => a + b;

test_5() {
  print(add_1(1, 2));
  print(add_2(1, 2));
  print(add_3(1, 2));
}

/*
 * 命名参数
 */
sayHello_1({String name}) {
  print("my name is $name");
}

sayHello_2({name: String}) {
  print("my name is $name");
}

test_6() {
  sayHello_1(name: "hongzhenw");
  sayHello_2(name: "wanghz");
  sayHello_1();
  sayHello_2();
}

/*
 * 位置参数
 */
sayHello_3(String name, int age, [String hobby]) {
  StringBuffer sb = new StringBuffer();
  sb.write("name=$name,age=$age");

  if (hobby != null) {
    sb.write(",hobby=$hobby");
  }

  print(sb.toString());
}

sayHello_4(String name, int age, [String hobby, String second]) {
  StringBuffer sb = new StringBuffer();
  sb.write("name=$name,age=$age");

  if (hobby != null) {
    sb.write(",hobby=$hobby,second=$second");
  }

  print(sb.toString());
}


test_7() {
  sayHello_3("wanghz", 10);
  sayHello_3("wanghz", 10, "football");
  sayHello_4("wanghz", 10, "football", "basketball");
}

/*
 * 参数默认值
 */
add_4({int a, int b = 3}) {
  return a + b;
}

add_5(int a, int b, [int c = 5]) {
  return a + b + c;
}


test_8() {
  print(add_4(a: 1));
  print(add_4(a: 1, b: 2));

  print(add_5(1, 2));
  print(add_5(1, 2, 3));
}

/*
 * 参数默认值
 */
showNum(int i) {
  print(i);
}

test_9() {
  var arr = [1, 2, 3, 4];
  arr.forEach(showNum);


  var num_1 = showNum;
  Function num_2 = showNum;
  var num_3 = (int i) => print(i);

  num_1(1);
  num_2(1);
  num_3(1);
}

/*
 * 匿名函数
 */
anonymity(Function func) {
  func("hello");
}

test_10() {
  anonymity((param) {
    print(param);
  });
}

/*
 * 运算符
 */
test_11() {
  // is运算符用于判断一个变量是不是某个类型的数据
  // is!则是判断变量不是某个类型的数据
  var str = "hello";
  print(str is String);

  var num = 18;
  print(num is! String);

  // ~/才是取整运算符，如果使用/则是除法运算，不取整
  var i = 1;
  var k = 2;
  print(i / k);
  print(i ~/ k);

  // ??=运算符 如果 ??= 运算符前面的变量为null，则赋值，否则不赋值
  var param1 = "hello",
      param2 = null;
  param1 ??= "world";
  param2 ??= "world";
  print("param1=$param1,param2=$param2");

  // ?.运算符
  var str1 = "hello world";
  var str2 = null;
  var str3 = "";

  print(str1?.length);

  print(str2?.length);
  //print(str2.length); 会crash

  print(str3?.length);
  print(str3.length);
}


/*
 * ..运算符（级联操作
 */
class Person {
  eat() {
    print("eat");
  }

  sleep() {
    print("sleep");
  }

  study() {
    print("study");
  }
}

test_12() {
  Person person = new Person();
  person
    ..eat()
    ..sleep()
    ..study();
}

/*
 * 控制流程
 */
test_13() {
  // if else语句
  int sorce = 80;
  if (sorce < 100) {
    print("<100");
  } else {
    print(">100");
  }

  print("##################");

  // switch语句
  var type = "reg";
  switch (type) {
    case "reg":
      print("reg");
      break;
    case "auth":
      print("auth");
      break;
    case "dereg":
      print("dereg");
      break;
    default:
      break;
  }

  print("##################");

  // for语句
  List<String> lists = ["a", "b", "c"];
  for (int i = 0; i < lists.length; i++) {
    print(lists[i]);
  }

  print("##################");

  for (String i in lists) {
    print(i);
  }

  print("##################");

  lists.forEach((item) => print(item));

  print("##################");

  // while语句
  int i = 1;
  while (i <= 100) {
    i++;
  }
  print(i);

  print("##################");

  // try catch语句
  try {
    1 ~/ 0;
  } catch (e) {
    print(e);
  }

  print("##################");

  try {
    1 ~/ 0;
  } on IntegerDivisionByZeroException {
    print("0");
  } catch (e) {
    print(e);
  }
}

/*
 * 类的定义与构造方法
 */
class Student {
  String name;
  int age;
  String address;

  Student(this.name, this.age, this.address);

  study() {
    print("name=$name,age=$age,address=$address");
  }

}

class Point {
  num x, y;

  Point(this.x, this.y);

  Point.origin(){
    x = 0;
    y = 0;
  }

  @override
  String toString() {
    return 'Point{x: $x, y: $y}';
  }

}

test_14() {
  Student student = new Student("hongzhenw", 10, "beijing");
  student.study();

  student.age = 20;
  student.address = "henan";
  student.study();

  Point point_1 = new Point(1, 2);
  print(point_1);

  Point point_2 = new Point.origin();
  print(point_2);
}

class Human {
  String name;

  Human.fromJson(){
    print("human data");
  }
}

class Man extends Human {

  Man.fromJson() : super.fromJson(){
    print("man data");
  }
}

test_15() {
  new Man.fromJson();
}

/*
 * 类的成员方法
 */
class Recttangle {
  num left, top, width, height;

  Recttangle(this.left, this.top, this.width, this.height);

  num get rigth => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;

  @override
  String toString() {
    return 'Recttangle{left: $left, top: $top, width: $width, height: $height}';
  }
}

test_16() {
  Recttangle rect = new Recttangle(10, 10, 10, 10);
  print(rect);

  print(rect.rigth);
  rect.right = 100;
  print(rect.left);
}

/*
 * 类的成员方法
 */
abstract class Duer {
  void doSth();

  void doGreet() {
    print("duer greet");
  }
}

class EffectiveDuer extends Duer {
  @override
  void doSth() {
    print("effective duer do sth");
  }
}

test_17() {
  EffectiveDuer duer = new EffectiveDuer();
  duer.doGreet();
}

/*
 * 枚举类
 */
enum ColorType {
  RED,
  BLUE,
  BLACK
}

showEnum(ColorType type) {
  switch (type) {
    case ColorType.RED:
      print("RED");
      break;
    case ColorType.BLUE:
      print("BLUE");
      break;
    case ColorType.BLACK:
      print("BLACK");
      break;
  }
}

test_18() {
  showEnum(ColorType.RED);
}

/*
 * mixins是一个重复使用类中代码的方式
 */
class A {
  a() {
    print("this is a");
  }
}

class B {
  b() {
    print("this is b");
  }
}

class C = A with B;

test_19() {
  C c = new C();
  c.a();
  c.b();
}

/*
 * 静态成员变量和静态成员方法
 */
class Cons {
  static const name = "hongzhenw";

  sayHello() {
    print("$name say hello");
  }

  static sayBye() {
    print("$name say bye");
  }
}

test_20() {
  Cons.sayBye();
  print(Cons.name);
}

test_() {

}

main() {
  test_20();
}