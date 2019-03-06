/*
 * 当前时间
 */
void test_1() {
  //创建时间对象，获取当前时间
  DateTime time = new DateTime.now();
  print(time);
}

/*
 * 指定时间
 */
void test_2() {
  DateTime time = new DateTime(1949, 9, 9);
  print("${time.year}/${time.month}/${time.day}");
}

/*
 * 时间字符串转换
 */
void test_3() {
  //将时间字符串转为时间对象
  DateTime time =  DateTime.parse("1969-12-22");
  print(time);
}

/*
 * 时间跨度
 */
void test_4() {
  //计算时间跨度，例如计算2天0时0分的跨度
  Duration duration = new Duration(days: 2,hours: 0,seconds: 0);
  print(duration);
}

main() {
  test_4();
}
