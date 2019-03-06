/*
 * if~else
 *
 * if语句和可选的else语句，简单的if语句可以用条件运算符( ? : )来处理
 */
void test_1() {
  int flag = 10;
  if (flag > 10) {
    print(">10");
  } else if (flag == 10) {
    print("=10");
  } else {
    print("<10");
  }
}

/*
 * 使用for循环进行迭代
 */
void test_2() {
  StringBuffer sb = new StringBuffer("Dart is fun");
  for (int i = 0; i < 5; i++) {
    sb.write("!");
  }
  print(sb.toString());
}

/*
 * 使用forEach()方法迭代iteration对象
 */
void test_3() {
  List<String> lists = ["a", "b", "c"];
  lists.forEach((item) {
    print(item);
  });
}


/*
 * 使用forEach()方法迭代iteration对象
 */
void test_4() {
  var lists = [1, 2, 3];
  for (var i in lists) {
    print(i);
  }
}


/*
 * while循环，先判断条件再进入循环
 */
void test_5() {
  int i = 0;
  while (i < 5) {
    print(i);
    i++;
  }
}

/*
 * do~while循环，先进入循环再判断条件
 */
void test_6() {
  int i = 0;
  do {
    print(i);
    i++;
  } while (i < 5);
}


/*
 * 使用break停止循环
 */
void test_7() {
  int i = 0;
  while (i < 5) {
    print(i);
    if (i == 3) {
      break;
    }
    i++;
  }
}

/*
 * 使用continue跳过本次循环
 */
void test_8() {
  for (int i = 0; i < 5; i++) {
    if (i == 3) {
      continue;
    }
    print(i);
  }
}

/*
 * switch通常用于整数、字符串和编译时常量的比较，比较的对象必须是同一类型，每一个case必须用break结束
 */
void test_9() {
  int num = 2;
  switch (num) {
    case 0:
      print(0);
      break;
    case 1:
      print(1);
      break;
    case 2:
      print(2);
      break;
    case 3:
      print(3);
      break;
    default:
      print("error");
  }
}

/*
 * 使用assert语句，如果布尔值为false就扰乱正常运行，只在检查模式下生效
 */
void test_10() {
  var text = "hello",
      number = 10,
      urlString = "https://www.baidu.com";
  //确保变量非空
  assert(text != null);

  //确保值小于100
  assert(number < 100);

  //确保这是一个https URL
  assert(urlString.startsWith('https'));
}

/*
 * 私有变量与函数
 *
 * dart语法中没有public、protected和private这些关键字，只要在标识符前面加“_”，就能声明私有变量或者函数
 */
class Person {
  String _name;
  String address;

  @override
  String toString() {
    return 'Person{_name: $_name, address: $address}';
  }
}

void test_11() {
  Person person = new Person();
  person._name = "hongzhen";
  person.address = "beijing";
  print(person);
}


main() {
  test_11();
}