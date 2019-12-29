import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/model/category_goods_list_entity.dart';

class CategoryGoodsItem extends StatefulWidget {
  List<CategoryGoodsListData> goodsList;

  CategoryGoodsItem(this.goodsList);

  @override
  _CategoryGoodsItemState createState() => _CategoryGoodsItemState();
}

class _CategoryGoodsItemState extends State<CategoryGoodsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(570),
      child: _goodsList(widget.goodsList)
    );
  }

//  商品单项内容左侧商品图片
  Widget _leftImaage(int index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(200),
      child: Image.network(
        widget.goodsList[index].image,
        fit: BoxFit.cover,
      ),
    );
  }

//  商品名称
  Widget _goodsTitle(int index) {
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(370),
      child: Text(
        widget.goodsList[index].goodsName,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  //  商品价格
  Widget _goodsPrice(int index) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Text('价格：${widget.goodsList[index].oriPrice}',
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: ScreenUtil().setSp(30),
                  decoration: TextDecoration.lineThrough)),
          Text(
            widget.goodsList[index].presentPrice.toString(),
            style: TextStyle(color: Colors.black26),
          ),
        ],
      ),
    );
  }


//  商品单项
  _goodsItem(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5,bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: Row(
          children: <Widget>[
            _leftImaage(index),
            Column(
              children: <Widget>[
                _goodsTitle(index),
                _goodsPrice(index)
              ],
            )
          ],
        ),
      ),
    );
  }

//  商品列表
  _goodsList(List<CategoryGoodsListData> list) {
    return ListView(
      children: _getGoodsList(list)
    );
  }

  // 获取商品列表
  List<Widget> _getGoodsList(List<CategoryGoodsListData> list) {
    List<Widget> goodsList = [];
    for (int i = 0; i <list.length; i ++) {
      goodsList.add(_goodsItem(i));
    }
    return goodsList;
  }
}
