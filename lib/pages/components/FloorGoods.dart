// 楼层标题

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorGoods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_floorTitle(), _floorContent(), _floorBottom()],
      ),
    );
  }

  // 楼层头部
  Widget _floorTitle() {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: Image.network(
        "http://pic49.nipic.com/file/20140928/4949133_153849953000_2.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  // 楼层内容
  Widget _floorContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(375),
              height: ScreenUtil().setHeight(500),
              child: InkWell(
                onTap: () {},
                child: Image.network(
                  "http://pic33.nipic.com/20131008/13661616_134400215000_2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
              // padding: const EdgeInsets.all(8.0),
              child: Container(
              height: ScreenUtil().setHeight(500),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Image.network(
                        "http://pic32.nipic.com/20130822/12012797_150219343140_2.jpg",
                        fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: Image.network(
                        "http://pic15.nipic.com/20110618/2488677_172209722330_2.jpg",
                        fit: BoxFit.cover),
                  ),
                ],
              ),
          ))
        ],
      ),
    );
  }

  Widget _floorBottom() {
    return Container(
      height: ScreenUtil().setHeight(200),
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(200),
              child: Image.network(
                "http://pic25.nipic.com/20121113/9252150_105400798000_2.jpg",fit: BoxFit.cover,),
            )
          ),
          Expanded(
            child: Container(
              height: ScreenUtil().setHeight(200),
              child: Image.network(
                "http://img3.cache.netease.com/photo/0001/2010-03-01/60M9HDLL00AQ0001.JPG",fit: BoxFit.cover,),
            )
          ),
        ],
      ),
    );
  }
}
