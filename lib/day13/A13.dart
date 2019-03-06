import 'dart:async';
import 'dart:convert';
import 'dart:io';

/*
 * 查询系统临时目录
 */
void test_1() {
  //获取系统临时目录
  var dirTemp = Directory.systemTemp;
  print(dirTemp);
}

/*
 * 删除一个文件、目录或链接
 */
void test_2() {
  //在系统临时目录下创建文件
  Directory.systemTemp.createTemp("my_temp_dir").then((directory) {
    //检查文件是否存在
    directory.exists().then(print);
    //删除文件
    return directory.delete();
  }).then((directory) {
    //再次检查文件是否存在
    directory.exists().then(print);
  });
}

/*
 * 重命名一个文件、目录或链接
 */
void test_3() {
  //获得系统临时目录
  var dirTemp = Directory.systemTemp;
  print(dirTemp);
  //创建一个文件
  new File("${dirTemp.path}/foo.txt").create().then((file) {
    print("文件路径在${file.path}");
    //重命名文件
    return file.rename("${dirTemp.path}/bar.txt");
  }).then((file) {
    print("文件路径在${file.path}");
  });
}


/*
 * 查看文件对象的类型
 */
void test_4() {
  //系统临时目录的列表
  Directory.systemTemp.list(recursive: true, followLinks: false)
  //读取每一个文件对象
      .listen((FileSystemEntity entity) {
    //查看文件对象的类型和路径
    FileSystemEntity.type(entity.path).then((FileSystemEntityType type) {
      String label;
      //判断文件类型
      switch (type) {
        case FileSystemEntityType.DIRECTORY:
          label = '目录';
          break;
        case FileSystemEntityType.FILE:
          label = '文件';
          break;
        case FileSystemEntityType.LINK:
          label = '链接';
          break;
        default:
          label = '未知';
      }
      //输出文件类型与路径
      print("$label：${entity.path}");
    }
    );
  });
}

/*
 * 获取父目录
 */
void test_5() {
  Directory.systemTemp.list(recursive: true, followLinks: false).listen((
      FileSystemEntity entity) {
    //输出文件对象的父路径
    print(entity.parent.path);
  });
}

/*
 * 创建文件
 */
void test_6() {
  var dirTemp = Directory.systemTemp;
  print(dirTemp);
  //在系统临时目录下创建两个目录一个文件
  new File("${dirTemp.path}/dir/subdir/file.txt").create(recursive: true).then((
      file) {
    print(file.path);
  });
}

/*
 * 以字符串读取文件
 */
void test_7() {
  var dirTemp = Directory.systemTemp;
  new File("${dirTemp.path}/dir/subdir/file.txt").readAsString().then((str) {
    print(str);
  });
}

/*
 * 以列表读取文件
 */
void test_8() {
  var dirTemp = Directory.systemTemp;
  new File("${dirTemp.path}/dir/subdir/file.txt").readAsLines().then(
          (List<String> str) {
        str.forEach((item) {
          print(item);
        });
      }
  );
}

/*
 * 以流读取文件
 */
void test_9() {
  final file = new File("${Directory.systemTemp.path}/dir/subdir/file.txt");
  //把文件转换成流
  Stream<List<int>> inputStream = file.openRead();
  inputStream
  //解码为UTF8
      .transform(utf8.decoder)
  //流转换为列表
      .transform(new LineSplitter())
  //设置输出
      .listen((String line) {
    print('$line有${line.length}个字节');
  }, onDone: () {
    print('文件已关闭');
  }, onError: (e) {
    //出错时输出错误信息
    print(e.toString());
  });
}
/*
 * 读取文件的错误处理
 */
void test_10() {
  new File("${Directory.systemTemp.path}/dir/subdir/file2.txt")
      .readAsString()
      .then((str) {
    print(str);
  }).catchError((e) {
    print("${e.runtimeType}:${e.message}");
  });
}

/*
 * 将字符串写入文件
 */
void test_11() {
  new File("${Directory.systemTemp.path}/dir/subdir/file.txt").writeAsString(
      "4,four").then((file) {
    print(file.path);
  });
}

/*
 * 将字节写入文件
 */
void test_12() {
  //编码为UTF8
  var encodeStr = utf8.encode("5,five");
  new File("${Directory.systemTemp.path}/dir/subdir/file.txt")
  //把字节写入文件
      .writeAsBytes(encodeStr)
  //读取并输出文件内容
      .then((file) {
    return file.readAsBytes();
  }).then((data) {
    print(utf8.decode(data));
  });
}


/*
 * 将流写入文件
 */
void test_13() {
  final file = new File("${Directory.systemTemp.path}/dir/subdir/file.txt");
  //创建一个新的IOSink
  var sink = file.openWrite();
  //将对象转成字符串，并写入文件
  sink.write("FILE ACCESSED ${new DateTime.now()}");
  //关闭IOSink释放系统资源
  sink.close();
}


main() {
  test_13();
}