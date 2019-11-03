import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommend extends StatelessWidget {
  final List<Map> recommendList;

  const Recommend({Key key, this.recommendList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ScreenUtil().setHeight(400),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), _recommendList()],
      ),
    );
  }

  // 推荐商品头部widget
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  // 每个商品单项widget
  Widget _item() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(width: 0.5, color: Colors.black12))),
        child: Column(
          children: <Widget>[
            Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1572610982&di=ceda3a7ffa22b3c19a937d8de101bb90&imgtype=jpg&er=1&src=http%3A%2F%2Fimg3.cache.hxsd.com%2Fhxsdmy%2Fshow%2F2012%2F01%2F64%2F29%2F00%2F11%2F11%2F20121111210029.jpg"),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "￥19.9",
                    style: TextStyle(),
                  ),
                  Text(
                    "￥29.9",
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 横向列表整合单个item商品
  Widget _recommendList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: this.recommendList.length,
        itemBuilder: (context, index) {
          return _item();
        },
      ),
    );
  }
}
