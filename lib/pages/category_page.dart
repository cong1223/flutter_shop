import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/CategoryBean.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'package:flutter_shop/pages/components/category/CategoryLeftNav.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';
import '../data/category_data.dart';
import 'components/category/CategoryRightNav.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    _getCategory();
    return Scaffold(
      appBar: AppBar(title: Text('商品分类'),),
      body: Container(
        child: Center(
          child: Row(
            children: <Widget>[
              CategoryLeftNav(),
              Column(
                children: <Widget>[
                  CategoryRightNav()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  // 获取分类列表
  void _getCategory() async {
    // await request('getCateGory').then((val){
    //   var data = json.decode(val.toString());
//    CategoryEntity list = CategoryEntity.fromJson(data);
    // });

    // 模拟数据
    CategoryBean categoryList = CategoryBean.fromJson(category);
    setState(() {
//      list = categoryList.data.cast<CategoryBean>();
    });
  }
}