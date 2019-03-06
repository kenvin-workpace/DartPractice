import 'dart:io';

import 'package:http_server/http_server.dart';

/*
 * 基本的HTTP服务器
 */
void test_1() {
  //绑定一个IPv4的HttpServer，设置8089端口
  HttpServer.bind(InternetAddress.loopbackIPv4, 8089).then((server) {
    //显示服务器地址和端口
    print("${server.address}:${server.port}");
    //通过编写HttpResponse对象让服务器响应请求
    server.listen((HttpRequest request) {
      //HttpResponse对象用于返回客户端
      request.response
      //获取和设置内容类型（报头）
        ..headers.contentType = new ContentType(
            "text", "plain", charset: "utf-8")
      //通过调用Object.toString将Object转换为一个字符串并转成对应编码发送到客户端
        ..write("Hello World!")
      //结束与客户端连接
        ..close();
    });
  });
}

/*
 * 文件服务器
 */
void test_2() {
  //设置根路径
  final MY_HTTP_ROOT_PATH = Platform.script.resolve("download").toFilePath();
  //从根路径获取文件和目录清单
  final virDir = new VirtualDirectory(MY_HTTP_ROOT_PATH);
  //是否获取文件和目录清单，为false则不获取
  virDir..allowDirectoryListing = true;
  HttpServer.bind(InternetAddress.loopbackIPv4.address, 8089).then((response) {
    response.listen((request) {
      //将文件和目录清单发送到客户端
      virDir.serveRequest(request);
    });
  });
}

/*
 * 设置首页
 */
VirtualDirectory virDir;

//成功错误的处理方法
void directoryHandler(dir, request) {
  //获取文件的路径
  var uriIndex = new Uri.file(dir.path).resolve("index.html");
  //返回指定的文件
  virDir.serveFile(new File(uriIndex.toFilePath()), request);
}

//404错误的处理方法
void errorHandler(HttpRequest request) {
  request.response
  //设置状态码，如果没有设置则默认HttpStatus.OK
    ..statusCode = HttpStatus.NOT_FOUND
    ..write("NOT_FOUND")
    ..close();
}

void test_3() {
  virDir = new VirtualDirectory(Platform.script.resolve("web").toFilePath());
  virDir
    ..allowDirectoryListing = true
  //覆盖默认的错误处理页面，要注意顺序（错误处理要放在正常处理前面，否则无效）
    ..errorPageHandler = errorHandler
  //用指定的文件覆盖默认返回的目录清单
    ..directoryHandler = directoryHandler;
  HttpServer.bind(InternetAddress.loopbackIPv4, 8089).then((response) {
    response.listen((request) {
      virDir.serveRequest(request);
    });
  });
}

main() {
  test_3();
}