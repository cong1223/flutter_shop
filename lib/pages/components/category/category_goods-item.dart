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
    return Container();
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
}
