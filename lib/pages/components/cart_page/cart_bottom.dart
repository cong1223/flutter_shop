import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';


class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child: Provide<CartProvider>(
        builder: (context,child,value) {
          return Row(
            children: <Widget>[
              selectAllBtn(context),
              allPriceArea(context),
              goButton(context)
            ],
          );
        },
      )
    );
  }

  //全选按钮
  Widget selectAllBtn(context){
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            activeColor: Colors.pink,
            onChanged: (bool val){},
          ),
          Text('全选')
        ],
      ),
    );
  }

  // 合计区域
  Widget allPriceArea(context){
    double allPrice = Provide.value<CartProvider>(context).allPrice;
    return Container(
      width: ScreenUtil().setWidth(400),
//      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(280),
                child: Text(
                    '合计:',
                    style:TextStyle(
                        fontSize: ScreenUtil().setSp(36)
                    )
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(120),
                child: Text(
                    '￥${allPrice}',
                    style:TextStyle(
                      fontSize: ScreenUtil().setSp(36),
                      color: Colors.red,
                    )
                ),

              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(430),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: ScreenUtil().setSp(22)
              ),
            ),
          )

        ],
      ),
    );
  }
  //结算按钮
  Widget goButton(context){
    int allGoodsCount = Provide.value<CartProvider>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(160),
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.only(left: 10),
      child:InkWell(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(3.0)
          ),
          child: Text(
            '结算(${allGoodsCount})',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ) ,
    );
  }

}