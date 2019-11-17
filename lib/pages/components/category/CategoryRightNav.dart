
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:flutter_shop/utils/MyBehavior.dart';
import 'package:provide/provide.dart';

class CategoryRightNav extends StatefulWidget {
  @override
  _CategoryRightNavState createState() => _CategoryRightNavState();
}

class _CategoryRightNavState extends State<CategoryRightNav> {
//  List list = ['全部','类别1','类别2','类别3','类别4','类别1','类别2','类别3','类别4'];
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context,child,childCategory){
        return Container(
            width: ScreenUtil().setWidth(570),
            height: ScreenUtil().setHeight(80),
            decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border(bottom: BorderSide(width: 1,color: Colors.black12))
            ),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                itemCount: childCategory.list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return _rightInkWell(childCategory.list[index].mallSubName);
                },
              ),
            )
        );
      },
    );
  }


  Widget _rightInkWell(String item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Text(item),
      ),
    );
  }
}


