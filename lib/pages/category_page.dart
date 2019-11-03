import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/CategoryBean.dart';
import 'package:flutter_shop/service/service_method.dart';
import '../data/category_data.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List<CategoryBean> list;

  @override
  Widget build(BuildContext context) {
    _getCategory();
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'),),
      body: Container(
        child: Center(
          child: Text('商品分类'),
        ),
      ),
    );
  }


  // 获取分类列表
  void _getCategory() async {
    // await request('getCateGory').then((val){
    //   var data = json.decode(val.toString());
    // });

    // 模拟数据
    CategoryBean categoryList = CategoryBean.fromJson(category);
    setState(() {
      list = categoryList.data.cast<CategoryBean>();
    });
  }
}