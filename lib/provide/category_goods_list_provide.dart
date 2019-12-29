import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_goods_list_entity.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryGoodsListData> goodsList = [];


  getCategoryGoodsList(List<CategoryGoodsListData> list) {
    this.goodsList = list;
    notifyListeners();
  }

}