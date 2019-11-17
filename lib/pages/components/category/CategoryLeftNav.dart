import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/CategoryBean.dart';
import 'package:flutter_shop/model/category_entity.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:provide/provide.dart';
import '../../../data/category_data.dart';

class CategoryLeftNav extends StatefulWidget {

  @override
  _CategoryLeftNavState createState() => _CategoryLeftNavState();
}

class _CategoryLeftNavState extends State<CategoryLeftNav> {

  CategoryEntity categoryEntity = CategoryEntity.fromJson(category);


  @override
  Widget build(BuildContext context) {
//    初始化provide的状态，正常情况下，是在请求后台分类列表数据时初始化的，这里就是模拟一下，反正就是要在渲染列表之前就要赋值了，一个默认值
    Provide.value<ChildCategory>(context).getChildCategory(categoryEntity.data[0].bxMallSubDto, 0);
    return Container(
      width: ScreenUtil().setWidth(180),
      child: ListView.builder(
        itemCount: categoryEntity.data.length,
        itemBuilder: (BuildContext context, int index) {
          return _leftInkWell(index);
        },
      ),
    );
  }

  _leftInkWell(int index) {
    return Provide<ChildCategory>(
      builder: (context,child,childCategory) {
        return Container(
          decoration: BoxDecoration(
              color: childCategory.currIndex == index ? Color.fromRGBO(236, 236, 236, 1.0) : Colors.white,
              border: Border(bottom: BorderSide(width: 1,color: Colors.black12))
          ),
          height: ScreenUtil().setHeight(100),
          child: GestureDetector(
              onTap: (){
                var childList = categoryEntity.data[index].bxMallSubDto;
                Provide.value<ChildCategory>(context).getChildCategory(childList,index);
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 15, 0, 10),
                child: Text(categoryEntity.data[index].mallCategoryName),
              )
          ),
        );
      },
    );
  }
}



