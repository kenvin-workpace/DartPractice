/*
 * 数字与布尔值 部分属性
 */
test_1() {
  int figureA = -10;
  // figureA是否为负数
  print(figureA.isNegative);
  // figureA是否是有限的
  print(figureA.isFinite);
  // figureA是否正无穷大或负无穷大
  print(figureA.isInfinite);

  double figureB = 64.742;
  // 返回figureB的符号，-1.0:值小于0、+1.0:值大于0、-0.0/0.0/NaN:值是其本身
  print(figureB.sign);
  // 返回figureB运行时的类型
  print(figureB.runtimeType);
  // 返回figureB的哈希码
  print(figureB.hashCode);

  int figureC = 13;
  // figureC是否为奇数
  print(figureC.isOdd);
  // figureC是否为偶数
  print(figureC.isEven);
  // 返回figureC所占存储位
  print(figureC.bitLength);
}

/*
 * 数字与布尔值 常用方法
 */
test_2() {
  int figureA = -10;
  // 返回figureA的绝对值
  print(figureA.abs());
  // 返回figureA的字符串
  print(figureA.toString());

  double figureB = 64.742;
  // 返回figureB的整数值
  print(figureB.toInt());
  // 返回figureB的双精度值
  print(figureB.toDouble());
  // 返回大于figureB的双精度值
  print(figureB.ceilToDouble());
  // 返回小于figureB的双精度值
  print(figureB.floorToDouble());
  // 返回figureB四舍五入的双精度值
  print(figureB.roundToDouble());
  // 返回figureB保留几位小数的字符串
  print(figureB.toStringAsFixed(2));
  // 返回figureB保留几位小数后精确结果的字符串
  print(figureB.toStringAsPrecision(3));

  int figureC = 31;
  // figureC对比其他整数，0:相同、1:大于、-1:小于
  print(figureC.compareTo(10));
  // 将figureC控制在指定区间的整数
  print(figureC.clamp(10, 20));
  // 返回figureC转换成指定基数(进制)的字符串
  print(figureC.toRadixString(16));

  int figureD = 2;
  // 返回figureD与其他整数的最大公约数
  print(figureD.gcd(10));
  // 返回figureD与其他整数的截取余数
  print(figureD.remainder(10));
  // 返回figureD几次幂值的字符串
  print(figureD.toStringAsExponential(2));
}

/*
 * 字符串常量与变量部分属性
 */
test_3() {
  String str = "hello world!";
  // 返回字符串的UTF-16代码单元列表
  print(str.codeUnits);
  // 返回根据代码单元生成的哈希码
  print(str.hashCode);
  // 字符串是否为空
  print(str.isEmpty);
  // 字符串是否不为空
  print(str.isNotEmpty);
  // 字符串的长度
  print(str.length);
  // 返回字符串Unicode代码的可迭代对象
  print(str.runes);
  // 返回对象运行时的类型
  print(str.runtimeType);
}

/*
 * 字符串常量与变量 常用方法
 */
test_4() {
  String str = " hello World! ";
  //截取字符串
  print(str.substring(1, 4));
  //在字符串中插入字符串
  print("hi,${str}");
  //输出字符串的Unicode编码
  print(str.codeUnitAt(0));
  print(str.codeUnits);
  //去掉字符串前后空格
  print(str.trimLeft());
  print(str.trimRight());
  print(str.trim());
  //字符串的大小写转换
  print(str.toLowerCase());
  print(str.toUpperCase());

  String str1 = "hello World!";
  //拆分字符串
  print(str1.split(" "));
  print(str1.split(new RegExp(r"W*")));

  //是否包含其他字符串
  print(str1.contains("W"));
  print(str1.contains(new RegExp(r"[A-Z]")));
  print(str1.contains("h", 0));
  print(str1.contains("h", 1));
  print(str1.contains(new RegExp(r"[A-Z]"), 0));
  print(str1.contains(new RegExp(r"[A-Z]"), 1));

  String str2 = "86";
  //在字符串前后补占位符
  print(str2.padLeft(4, "0"));
  print(str2.padRight(4, "0"));

  String str3 = "Dartisans";
  //获取指定字符出现的位置
  print(str1.indexOf("W"));
  print(str1.indexOf(new RegExp(r"[A-Z][a-z]")));
  print(str3.lastIndexOf("a"));
  print(str3.lastIndexOf(new RegExp(r"a[r|n]")));

  //替换字符串中所有匹配字符
  print(str3.replaceAll("a", "A"));
  print(str3.replaceAll(new RegExp(r"a"), "A"));
}

/*
 * 字符串常量与变量 常用方法
 */
test_5() {
  StringBuffer sb = new StringBuffer();
  sb.write("hello");
  sb.write("world");
  print(sb);

  // 返回字符串缓冲区的哈希码
  print(sb.hashCode);
  // 字符串缓冲区是否为空
  print(sb.isEmpty);
  // 字符串缓冲区是否不为空
  print(sb.isNotEmpty);
  // 返回字符串缓冲区累积内容的长度
  print(sb.length);
  // 返回对象运行时的类型
  print(sb.runtimeType);

  // 清除字符串缓冲区
  sb.clear();
  print(sb);
  print("end");
}

/*
 * 正则表达式 部分属性
 */
test_6() {
  RegExp regExp = new RegExp(r"(\w+)");
  // 返回正则表达式的哈希码
  print(regExp.hashCode);
  // 正则表达式是否区分大小写
  print(regExp.isCaseSensitive);
  // 正则表达式是否匹配多行
  print(regExp.isMultiLine);
  // 返回源正则表达式字符串
  print(regExp.pattern);
  // 返回对象运行时的类型
  print(regExp.runtimeType);
}

/*
 * 正则表达式 常用方法
 */
test_7() {
  RegExp regExp = new RegExp(r"(\w+)");
  // 返回正则表达式匹配项的可迭代对象
  print(regExp.allMatches("abc edf hij"));
  // 搜索并返回第一个匹配项，没有则返回null
  print(regExp.firstMatch("d"));
  // 正则表达式是否找到匹配项
  print(regExp.hasMatch("d"));
  // 从第几个字符开始匹配正则表达式
  print(regExp.matchAsPrefix("abc edf", 3));
  // 返回正则表达式的第一个匹配字符串
  print(regExp.stringMatch("abc edf"));
  // 返回正则表达式的字符串表示
  print(regExp.toString());
}

/*
 * 正则表达式 验证邮政编码的正则，返回是否匹配的布尔值
 */
test_8() {
  RegExp regExp = new RegExp(r"\d{6}");
  print(regExp.hasMatch("123456"));
  print(regExp.hasMatch("1234567"));
  print(regExp.hasMatch("123A4567"));
}

/*
 * 正则表达式 验证手机号码的正则，以Iterable< Match >返回所有匹配项
 */
test_9() {
  RegExp mobile = new RegExp(
      r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
  Iterable<Match> mobiles = mobile.allMatches(
      "13812345678 12345678901 17012345678");
  for (Match m in mobiles) {
    String result = m.group(0);
    print(result);
  }
}

/*
 * 正则表达式 验证手机号码的正则，以Iterable< Match >返回所有匹配项
 */
test_10() {
  RegExp url = new RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
  Match match = url.firstMatch("http://www.google.com");
  print(match.group(0));
}

/*
 * 正则表达式 验证身份证号码的正则，返回第一个匹配的字符串
 */
test_11() {
  RegExp identity = new RegExp(r"\d{17}[\d|x]|\d{15}");
  print(identity.stringMatch("My id number is 35082419931023527x"));
}

main() {
  test_11();
}