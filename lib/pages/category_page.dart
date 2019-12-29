import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/model/CategoryBean.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'package:flutter_shop/model/category_goods_list_entity.dart';
import 'package:flutter_shop/pages/components/category/CategoryLeftNav.dart';
import 'package:flutter_shop/provide/category_goods_list_provide.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';
import '../data/category_data.dart';
import 'components/category/CategoryRightNav.dart';
import '../data/category_goods_list.dart';
import 'components/category/category_goods-item.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  CategoryGoodsListEntity categoryGoods = CategoryGoodsListEntity.fromJson(categoryGoodsList);

  @override
  void initState() {
    this._getCategoryGoodsList();
    super.initState();
  }
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
                  CategoryRightNav(),
                  Expanded(
                    child: CategoryGoodsItem(categoryGoods.data)
                  ),
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


//  获取分类商品列表
  _getCategoryGoodsList({String categoryId}) async {
//    var data = {
//      'categoryId': categoryId == null ? 4 : categoryId,
//      'CategorySubId': '',
//      'page': 1
//    };
//    request('xxxxxx',params: data).then((val) {
//      var data = json.decode(val.toString);
//      CategoryGoodsListEntity goodsList = CategoryGoodsListEntity.fromJson(val);
//    });


    CategoryGoodsListEntity goodsList = CategoryGoodsListEntity.fromJson(categoryGoodsList);

    Provide.value<CategoryGoodsListProvide>(context).getCategoryGoodsList(goodsList.data);

  }
}