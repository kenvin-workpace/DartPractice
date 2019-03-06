import 'dart:io';

/*
 * 获取环境变量
 */
void test_1() {
  //获取当前进程的环境变量
  Map<String, String> maps = Platform.environment;
  print(maps);

  print(maps["PATH"].replaceAll(";", "\n"));
}

/*
 * 识别操作系统
 */
void test_2() {
  //第一种方法：获取操作系统的字符串
  String os = Platform.operatingSystem;
  print(os);

  //第二种方法：检查操作系统
  print(""
      ":${Platform.isWindows}"
      ":${Platform.isAndroid}"
      ":${Platform.isFuchsia}"
      ":${Platform.isMacOS}");
}

/*
 * 获取运行脚本信息
 */
void test_3() {
  //获取正在运行的脚本的URI
  Uri uri = Platform.script;
  print(uri);
  //将URI转换成路径
  print(uri.toFilePath());
}

main() {
  test_3();
}
