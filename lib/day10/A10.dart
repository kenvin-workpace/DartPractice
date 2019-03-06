/*
 * 实例变量
 *
 * 声明实例变量时，所有未初始化的实例变量的值为null
 */
class Point {
  int x,
      y,
      z = 0;
}

void test_1() {
  Point point = new Point();
  print(point.x);
  print(point.y);
  print(point.z);

  Point point_2 = new Point();
  point_2.x = 1;
  point_2.y = 2;
  print(point_2.x);
  print(point_2.y);
  print(point_2.z);
}

/*
 * 声明构造函数
 *
 * 构造函数就是一个与类同名的函数，关键字 this 是指当前的，只有在命名冲突时有效，否则dart会忽略处理
 * 如果你没有声明构造函数，默认有构造函数，默认构造函数没有参数，调用父类的无参构造函数。子类不能继承父类的构造函数
 */
class Student {
  String name;
  int age;

  Student(String name, int age) {
    this.name = name;
    this.age = age;
  }
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

void test_2() {
  Student student = new Student("wanghz", 10);
  print("${student.name + "," + student.age.toString()}");
}

void test_3() {
  Person person = new Person("hongzhenw", 11);
  print("${person.name + "," + person.age.toString()}");
}

/*
 * 命名构造函数
 *
 * 使用命名构造函数让类有多个构造函数
 */
class Teacher {
  int x, y;

  Teacher(this.x, this.y);

  // 命名构造函数
  Teacher.fromJson(Map map){
    x = map["x"];
    y = map["y"];
  }
}

void test_4() {
  Teacher teacher = new Teacher.fromJson({"x": 1, "y": 2});
  print("${teacher.x.toString() + " , " + teacher.y.toString()}");
}

/*
 * 父类的构造函数
 *
 * 子类构造函数调用父类的默认构造函数，如果父类没有默认构造函数，必须手动调用父类的构造函数，在 : 号后面指定父类的构造函数
 */
class Employer {
  Employer.fromJson(Map map){
    print("Employer fromjson");
  }
}

class Employee extends Employer {
  Employee.fromJson(Map map) : super.fromJson(map){
    print("employee fromjson");
  }
}

void test_5() {
  new Employee.fromJson({});
}

/*
 * 初始化实例变量
 *
 * 除了调用父类的构造函数，还可以在构造函数体运行之前初始化实例变量
 */
class PPoint {
  int x, y;

  PPoint(this.x, this.y);

  PPoint.fromJson(Map map)
      :x=map["x"],
        y = map["y"]{
    print("x=$x,y=$y");
  }
}

void test_6() {
  new PPoint.fromJson({"x": 1, "y": 2});
}

/*
 * 重定向构造函数
 *
 * 构造函数可以重定向到同类的另一个构造函数
 */
class PPPoint {
  int x, y;

  PPPoint(this.x, this.y);

  PPPoint.fromJson(int z) :this(z, 0);
}

void test_7() {
  PPPoint point = new PPPoint.fromJson(1);
  print("${point.x.toString() + " , " + point.y.toString()}");
}

/*
 * 常量构造函数
 *
 * 想让类生成的对象永远不会改变，可以让这些对象变成编译时常量，定义一个const构造函数并确保所有实例变量是final的
 */
class ImmutablePoint {
  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);

  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

void test_8() {
  ImmutablePoint point = new ImmutablePoint(1, 1);
  print("${point.x.toString() + " , " + point.y.toString()}");
}

/*
 * 工厂构造函数
 *
 * 使用factory关键字实现构造函数时，不一定要创建一个类的新实例，例如，一个工厂的构造函数可能从缓存中返回一个实例，或者返回一个子类的实例
 */
class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  Logger._internal(this.name);

  factory Logger(String name){
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      Logger logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

void test_9() {
  var logger = new Logger("UI");
  logger.log("button clicked");
}

/*
 * getter和setter
 *
 * getter和setter是特殊的方法，可以读写访问对象的属性，
 * 每个实例变量都有一个隐式的getter，适当的加上一个setter可以通过实现getter和setter创建附加属性，使用get和set关键词
 */
class Rectangle {
  int left;
  int top;

  Rectangle(this.left, this.top);

  int get right => left + 10;

  set right(value) => value;

  int get bottom => top + 10;

  set bottom(value) => value;
}

void test_10() {
  Rectangle rectangle = new Rectangle(10, 10);
  rectangle.right = 10;
  print(rectangle.right);

  rectangle.bottom = 10;
  print(rectangle.bottom);
}

/*
 * 隐式接口
 *
 * 每个类都有一个隐式定义的接口，包含所有类和实例成员，通过implements子句声明一个类实现一个或多个接口，然后提供所需的api接口
 */
class IPerson {
  final String _name;

  IPerson(this._name);

  String greet(who) => "hi $who,I am $_name";
}

class IStudent {
  void printStudent() => print("student");
}

class Imposter_1 implements IPerson {

  @override
  String get _name => null;

  @override
  String greet(who) {
    return "Hi $who. Do you know who I am?";
  }
}

class Imposter_2 implements IPerson, IStudent {

  @override
  String get _name => null;

  @override
  String greet(who) {
    return "Hi $who. Do you know who I am?";
  }

  @override
  void printStudent() {
    print("Imposter_2 student");
  }

}

greetBob(IPerson person) => person.greet("bob");

void test_11() {
  print(greetBob(new Imposter_1()));
  print(greetBob(new IPerson("wanghz")));

  Imposter_2 imposter = new Imposter_2();
  print(greetBob(imposter));
  imposter.printStudent();
}

/*
 * 枚举类型
 *
 * 枚举类型是一种特殊的类，用于表示一个固定数量的常量值，不能实例化，使用enum关键字声明一个枚举类型
 */
enum Color {
  RED,
  BLUE,
  YELLOW
}

void test_12() {
  print(Color.RED.index);
  print(Color.BLUE.index);
  print(Color.YELLOW.index);

  // 获得枚举值的列表
  List<Color> colors = Color.values;
  print(colors[2]);

  // 在switch语句中使用枚举
  Color color = Color.BLUE;
  switch (color) {
    case Color.RED:
      print("red");
      break;
    case Color.BLUE:
      print("blue");
      break;
    case Color.YELLOW:
      print("yellow");
      break;
    default:
      print("other");
  }
}

/*
 * 扩展类
 *
 * 使用with关键字后面跟着一个或多个扩展类名
 */
class IShow {
}

abstract class INumber {
  bool one = false;
  bool two = false;
  bool three = false;

  void showNum() {
    if (one) {
      print("one");
    } else if (two) {
      print("two");
    } else {
      print("three");
    }
  }
}

class IShowNumber extends IShow with INumber {
  IShowNumber() {
    two = true;
  }
}

void test_13() {
  IShowNumber show = new IShowNumber();
  show.showNum();
}

/*
 * 静态变量
 *
 * 静态变量即类变量，是类的常量
 */
class IColor {
  // 不可变的实例变量
  final String name;

  // 构造常量函数
  const IColor(this.name);

  // 静态常量
  static const IColor color = const IColor("red");
}

void test_14() {
  print(IColor.color.name);
}

/*
 * 静态变量
 *
 * 静态变量即类变量，是类的常量
 */
class hello {

  static String getHelloResult() {
    return "Hello World!";
  }
}

void test_15() {
  print(hello.getHelloResult());
}

main() {
  test_15();
}