/*
 * 固定长度的列表，一旦定义就无法改变长度
 */
test_1() {
  List<int> lists = new List(4);
  lists[0] = 12;

  print(lists);
  print(lists[0]);
}

/*
 * 固定长度的列表，一旦定义就无法改变长度
 */
test_2() {
  List<int> lists = [1, 2];
  print(lists);

  lists.length = 0;
  print(lists);

  lists.add(10);
  print(lists);

  lists[0] = 100;
  print(lists);
}

/*
 * 固定长度的列表，一旦定义就无法改变长度
 */
test_3() {
  // 创建固定长度的列表
  List lists = new List(3);
  print(lists.length);

  // 创建可改变长度的列表
  List lists_2 = new List();
  print(lists_2.length);

  lists_2.length = 3;
  print(lists_2.length);

  // 创建可在固定范围内改变长度的列表
  List lists_3 = new List()
    ..length = 500;

  print(lists_3.length);

  // 创建包含所有元素的固定长度列表
  List lists_4 = new List.unmodifiable([1, 2, 3]);
  print(lists_4.length);
  print(lists_4);

  // 创建包含所有元素的可改变长度列表
  List lists_5 = new List.from([1, 2, 3]);
  print(lists_5.length);
  print(lists_5);

  lists_5.add(4);
  print(lists_5);

  // 为所有元素统一赋值
  List lists_6 = new List<int>.filled(3, 0);
  print(lists_6.length);
  print(lists_6);

  // 用生成器给所有元素赋初始值
  List lists_7 = new List<int>.generate(4, (int index) {
    print("....$index...");
    return index * index;
  });
  print(lists_7);
}

/*
 * 所有属性
 */
test_4() {
  List lists = new List.generate(4, (int index) {
    return index * index;
  });
  // 返回第一个元素
  print(lists.first);
  // 返回最后一个元素
  print(lists.last);
  // 返回列表的哈希码
  print(lists.hashCode);
  // 列表是否为空
  print(lists.isEmpty);
  // 列表是否不为空
  print(lists.isNotEmpty);
  // 返回一个新的迭代器
  print(lists.iterator);
  // 列表中多少个元素
  print(lists.length);
  // 返回相反顺序的列表
  print(lists.reversed);
  // 返回对象运行时的类型
  print(lists.runtimeType);
  // 列表是否只有一个元素，则否报错
  print(lists.single);
}

/*
 * 返回多种类型的输出
 */
test_5() {
  List lists = new List.from([1, 2, 3]);
  // 返回列表的字符串表示
  print(lists.toString());
  // 返回列表的集表示
  print(lists.toSet());
  // 返回列表的列表表示
  print(lists.toList());
  // 用指定字符连接列表元素
  print(lists.join(","));
}

/*
 * 给列表增加元素
 */
test_6() {
  List lists = new List();
  // 增加一个元素到列表末尾
  lists.add(1);
  print(lists);
  // 增加一个元素到指定下标
  lists.insert(1, 2);
  print(lists);
  // 增加一个列表到列表末尾
  lists.addAll([3, 4]);
  print(lists);
  // 增加一个列表到指定下标
  lists.insertAll(2, [5, 6]);
  print(lists);
}

/*
 * 给列表增加元素
 */
test_7() {
  List lists = new List.from([1, 2, 3, 3, 3, 4]);
  print(lists);

  // 移除列表中匹配的第一个元素
  lists.remove(3);
  print(lists);
  // 移除列表中第几个元素
  lists.removeAt(0);
  print(lists);
  // 移除列表中最后一个元素
  lists.removeLast();
  print(lists);
  // 移除列表的所有元素
  lists.clear();
  print(lists);

  List lists_2 = [1, 2, 3, 4, 5, 6];
  print(lists_2);
  // 移除开始下标（不包括）至结束下标（包括）内的元素
  lists_2.removeRange(1, 3);
  print(lists_2);

  List lists_3 = [1, 2, 3, 4, 5, 6];
  // 移除并替换开始下标（不包括）至结束下标（包括）内的元素
  lists_3.replaceRange(1, 3, [22, 33]);
  print(lists_3);

  List lists_4 = ["one", "two", "three", "four"];
  // 移除所有满足条件的元素，此为Dart的一种速写语法
  lists_4.removeWhere((item) => item.length == 3);
  print(lists_4);

  List lists_5 = ["one", "two", "three", "four"];
  lists_5.removeWhere((item) {
    return item.length == 3;
  });
  print(lists_5);

  List lists_6 = ["one", "two", "three", "four"];
  // 移除所有不满足条件的元素，此为Dart的一种速写语法
  lists_6.retainWhere((item) => item.length == 3);
  print(lists_6);

  List lists_7 = ["one", "two", "three", "four"];
  lists_7.retainWhere((item) {
    return item.length == 3;
  });
  print(lists_7);
}

/*
 * 给列表增加元素
 */
test_8() {
  List lists = ["Alice", "Daphne", "Elizabeth", "Joanna"];
  lists.forEach((item) {
    print(item);
  });
}

/*
 * 给列表增加元素
 */
test_9() {
  List lists = ["Alice", "Daphne", "Elizabeth", "Joanna", "Joanna"];
  print(lists);

  // 列表中是否包含指定元素
  print(lists.contains("Joanna"));
  // 返回列表中的第几个元素
  print(lists.elementAt(2));
  // 返回列表中第一个匹配元素的下标
  print(lists.indexOf("Joanna"));
  // 返回列表中最后一个匹配元素的下标
  print(lists.lastIndexOf("Joanna"));

  // 返回从开始下标（包括）到结束下标（不包括）元素的列表
  print(lists.sublist(1, 4));
  // 返回从开始下标（包括）到最后一个元素的列表
  print(lists.sublist(1));
}

/*
 * 对列表元素做一些改动
 */
test_10() {
  List lists = ["a", "b", "c", "d"];
  print(lists);
  // 从第几个元素开始覆盖原列表
  lists.setAll(1, ["bb","cc"]);
  print(lists);

  List lists_2 = [1,2,3,4,5];
  // 对列表进行随机排序
  lists_2.shuffle();
  print(lists_2);

  List lists_3 = [1,6,2,3,4,5];
  // 对列表进行顺序排序
  lists_3.sort();
  print(lists_3);

}

test_() {

}

main() {
  test_10();
}