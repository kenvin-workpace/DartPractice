/*
 * 映射也就是键值对，每个键都有与之相关联的一个值
 */
test_1() {
  Map<String, int> maps = {"a": 1, "b": 2, "c": 3};
  print(maps["b"]);

  List lists = [1, 2, 3, 4, 5];
  Map<String, int> maps_2 = new Map.fromIterable(
      lists, key: (item) => item.toString(), value: (item) => item);
  // 1 + 4 = 5
  print(maps_2["1"] + maps_2["4"]);
  // 5 - 3 = 2
  print(maps_2["5"] - maps_2["3"]);


  List<String> lists_2 = ["a", "b", "c"];
  List<int> lists_3 = [1, 2, 3];

  Map<String, int> maps_3 = new Map.fromIterables(lists_2, lists_3);
  // 1 + 2 = 3
  print(maps_3["a"] + maps_3["b"]);
}

/*
 * 所有属性
 */
test_2() {
  Map<String, int> maps = {"a": 1, "b": 2, "c": 3};
  print(maps);

  // 返回映射的哈希码
  print(maps.hashCode);
  // 映射上是否没有键值对
  print(maps.isEmpty);
  // 映射上是否有键值对
  print(maps.isNotEmpty);
  // 返回映射的所有键
  print(maps.keys);
  // 返回映射的所有值
  print(maps.values);
  // 返回映射上键值对的数目
  print(maps.length);
  // 返回对象运行时的类型
  print(maps.runtimeType);
}

/*
 * 所有属性
 */
test_3() {
  Map<String, int> maps = {"a": 1, "b": 2, "c": 3};
  // 返回映射的字符串表示
  print(maps.toString());
  // 按顺序迭代映射
  maps.forEach((key, value) {
    print(key + ":" + value.toString());
  });
  // 添加其他键值对到映射中
  maps.addAll({"d": 4, "e": 5});
  print(maps);
  // 映射是否包含指定键
  print(maps.containsKey("d"));
  // 映射是否包含指定值
  print(maps.containsValue(5));
  // 删除指定键值对
  maps.remove("a");
  print(maps);
  // 删除所有键值对
  maps.clear();
  print(maps);

  Map<String, int> scores = {"bob": 36};
  for (String key in ["bob", "coc", "doddd"]) {
    scores.putIfAbsent(key, () => key.length);
  }
  print(scores["bob"]);
  print(scores["coc"]);
  print(scores["doddd"]);
}

main() {
  test_3();
}