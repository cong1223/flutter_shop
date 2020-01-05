import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/cart_info_model.dart';
import 'package:flutter_shop/provide/cart.dart';
import 'package:provide/provide.dart';

class CartCount extends StatelessWidget {
  CartInfoMode item;
  CartCount(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top:5.0),
      decoration: BoxDecoration(
          border:Border.all(width: 1 , color:Colors.black12)
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context,item),
          _countArea(context),
          _addBtn(context,item),
        ],
      ),
    );
  }

  // 减少按钮
  Widget _reduceBtn(BuildContext context,CartInfoMode item){
    return InkWell(
      onTap: (){
        Provide.value<CartProvider>(context).changeGoodsCount(item, 'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,

        decoration: BoxDecoration(
            color: Colors.white,
            border:Border(
                right:BorderSide(width:1,color:Colors.black12)
            )
        ),
        child: Text('-'),
      ),
    );
  }

  //添加按钮
  Widget _addBtn(BuildContext context,CartInfoMode item){
    return InkWell(
      onTap: (){
        Provide.value<CartProvider>(context).changeGoodsCount(item, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,

        decoration: BoxDecoration(
            color: Colors.white,
            border:Border(
                left:BorderSide(width:1,color:Colors.black12)
            )
        ),
        child: Text('+'),
      ),
    );
  }

  //中间数量显示区域
  Widget _countArea(BuildContext context){
    int allGoodsCount = Provide.value<CartProvider>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      color: Colors.white,
      child: Text(allGoodsCount.toString()),
    );
  }
}
