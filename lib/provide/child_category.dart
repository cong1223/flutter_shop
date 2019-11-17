import 'package:flutter/material.dart';
import 'package:flutter_shop/model/category_entity.dart';

class ChildCategory with ChangeNotifier {
  List<CategoryDataBxmallsubdto> list;
  int currIndex = 0;

  getChildCategory(list,currIndex) {
    CategoryDataBxmallsubdto all = CategoryDataBxmallsubdto();
    all.mallSubName = '全部';
    all.comments = 'null';
    all.mallCategoryId = '00';
    all.mallSubId = '00';
    this.list = [all];
    this.list.addAll(list);
    this.currIndex = currIndex;
    notifyListeners();
  }
}