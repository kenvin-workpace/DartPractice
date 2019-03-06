import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

/*
 * 实例
 */
Future<String> getNetData() async {
  http.Response response = await http.get(
      "https://m1.cmbc.com.cn:8003/CMBC_MBServer/scripts/Server/teset.json");
  return response.body;

  //getNetData().then((str) {
  //  print(str);
  //});
}


/*
 * GET请求
 */
test_1() {
  http.get(
      "https://m1.cmbc.com.cn:8003/CMBC_MBServer/scripts/Server/teset.json")
      .then((response) {
    print("响应状态:${response.statusCode}");
    print("响应正文:${response.body}");
  });
}


/*
 * POST请求
 */
test_2() {
  var url = 'http://httpbin.org/post';
  http.post(url, body: "name=doodle&color=blue").then((response) {
    print("响应状态:${response.statusCode}");
    print("响应正文:${response.body}");
  });
}


/*
 * 展示JSON数据
 */
test_3() {
  var url = 'https://api.github.com/users/dart-lang/repos';
  http.get(url, headers: {'User-Agent': 'Dart/1.0(My Dart client)'}).then((
      response) {
    //解析响应字符串，并生成Json对象
    List<String> repos = json.decode(response.body);
    print(repos);
  });
}

/*
 * 向服务器发多个请求
 */
showBody(http.Response response) {
  //输出响应正文的长度
  print(response.body.length);
  //控制输出的长度在100以内
  if (response.body.length > 100) {
    print(response.body.substring(0, 100));
  } else {
    print(response.body);
  }
  print("\n");
}

test_4() {
  var url = 'http://www.baidu.com/';
  //Client类，保持持久连接，向同一个服务器发多个请求
  http.Client client = new http.Client();
  client.get("$url/serch").then((response) {
    showBody(response);
    return client.get("$url/doodles");
  })
      .then(showBody)
  //完成后关闭Client连接
      .whenComplete(client.close);
}


/*
 * 处理请求错误
 */
handleSuccess(http.Response response) {
  print('成功访问了网站！');
  print(response.body);
}

handleFailure(error) {
  print('发生了一些错误！');
  print(error.message);
}

test_5() async {
  var url = "http://some_bogus_website.org";
  await http.get(url)
      .then(handleSuccess)
      .catchError(handleFailure);
}

/*
 * 获取重定向的记录
 */
test_6() async {
  HttpClient client = new HttpClient();
  //使用GET方法打开一个HTTP连接
  await client.getUrl(Uri.parse("http://www.baidu.com"))
      .then((request) => request.close())
      .then((response) {
    //获得所有重定向的列表
    List<RedirectInfo> infos = response.redirects;
    //循环输出重定向的记录
    infos.forEach((info) {
      print(info.location);
    });
  });
}

/*
 * 获取响应正文的字符串
 */
test_7() async {
  await http.read(
      "https://m1.cmbc.com.cn:8003/CMBC_MBServer/scripts/Server/teset.json")
      .then((response) {
    print(response);
  }).catchError((error) {
    print(error);
  });
}

test_8() async {
  String url = "https://www.baidu.com/img/bd_logo1.png";
  await http.get(url).then((reponse) {
    //将响应内容转换成字节列表
    List<int> bytes = reponse.bodyBytes;
    print(bytes);
    //将字节列表转换成Base64编码的字符串
    String result = base64.encode(bytes);
    print(result);
  });
}

/*
 * 获取响应正文的字符串
 */
test_9() async {
  await http.get("http://www.baidu.com").then((response) {
    //获取头文件的映射
    print(response.headers.keys);
    //获取头文件的信息
    print("access-control-allow-origin = ${response
        .headers['access-control-allow-origin']}");
    print("content-type = ${response.headers['content-type']}");
    print("date = ${response.headers['date']}");
    print("content-length = ${response.headers['content-length']}");
    print("connection = ${response.headers['connection']}");
  });
}

main() {
  test_9();
}