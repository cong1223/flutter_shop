import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvider>(
      builder: (context,child,value) {
        var detailsInfo = Provide.value<DetailsInfoProvider>(context).goodsInfo.data.goodInfo;
        if(detailsInfo == null) {
          return Text('正在加载中');
        }else {
          return Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                _getImage(detailsInfo.image1),
                _getGoodsName(detailsInfo.goodsName),
                _getGoodsNumber(detailsInfo.goodsSerialNumber),
                _goodsPrice(detailsInfo.presentPrice,detailsInfo.oriPrice)
              ],
            ),
          );
        }
      },
    );
  }

  // 商品图片
  Widget _getImage(String url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  // 商品名称
  Widget _getGoodsName(String name) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  // 商品编号
  Widget _getGoodsNumber(String num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        '商品编号:${num}',
        style: TextStyle(color: Colors.black12),
      ),
    );
  }

  // 商品价格
  //商品价格方法

  Widget _goodsPrice(presentPrice,oriPrice){

    return  Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      margin: EdgeInsets.only(top:8.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥${presentPrice}',
            style: TextStyle(
              color:Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40),

            ),

          ),
          Text(
            '市场价:￥${oriPrice}',
            style: TextStyle(
                color: Colors.black26,
                decoration: TextDecoration.lineThrough
            ),


          )
        ],
      ),
    );

  }
}
