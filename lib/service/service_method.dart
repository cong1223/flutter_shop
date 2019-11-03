// 获取首页数据

import 'dart:io';
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_shop/config/service_url.dart';

// params为可选参数
Future request(url,{params}) async{
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String; 
    if (params == null) {
      response = await dio.post(servicePath[url]);
    }else {
      response = await dio.post(servicePath[url],data:params);
    }
    if (response.statusCode == 200) {
      return response.data;
    }else {
      throw Exception("服务端出现错误!");
    }
  } catch (e) {
    return print(e);
  }
}
