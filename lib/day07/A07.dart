/*
 * 集的每个对象只能出现一次，不能重复
 */
test_1() {
  Set sets = new Set();
  sets.add("a");
  print(sets);

  sets.addAll(["b", "c"]);
  print(sets);
}

/*
 * 集的每个对象只能出现一次，不能重复
 */
test_2() {
  Set sets = new Set.from(["a", "b", "c", "d", "e"]);
  print(sets);

  // 返回第一个元素
  print(sets.first);
  // 返回元素的数量
  print(sets.length);
  // 集是否没有元素
  print(sets.isEmpty);
  // 集是否有元素
  print(sets.isNotEmpty);
  // 返回集的哈希码
  print(sets.hashCode);
  // 返回对象运行时的类型
  print(sets.runtimeType);
  // 返回集的可迭代对象
  print(sets.iterator);
  // 集只有一个元素就返回元素，否则异常
  print(sets.single);
}

/*
 * 常用方法
 */
test_3() {
  Set sets = new Set.from(["a", "b", "c"]);
  print(sets);

  // 添加一个值
  sets.add("d");
  print(sets);
  // 添加一些值
  sets.addAll(["e","f"]);
  print(sets);
  // 以字符串输出集
  print(sets.toString());
  // 将集的值用指定字符连接，以字符串输出
  print(sets.join(","));
  // 集是否包含指定值
  print(sets.contains("e"));
  // 集是否包含一些值
  print(sets.containsAll(["e","f"]));
  print(sets.containsAll(["e","d"]));
  // 返回集的第几个值
  print(sets.elementAt(1));
  // 删除集的指定值，成功则返回true
  print(sets.remove("a"));
  print(sets);
  // 删除集的一些值
  sets.removeAll(["e","f"]);
  print(sets);
  // 删除集的所有值
  sets.clear();
  print(sets);
}

main() {
  test_3();
}