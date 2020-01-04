import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/cart_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart' as prefix0;

class CartProvider with ChangeNotifier {
  String cartString = "";
  List<CartInfoMode> cartList = [];
  double allPrice = 0.0;
  int allGoodsCount = 0;

  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cartString = sharedPreferences.getString("cartInfo");
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int ival = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        isHave = true;
        tempList[ival]['count']++;
        cartList[ival].count++;
      }
      ival++;
    });
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': true
      };
      tempList.add(newGoods);
      cartList.add(CartInfoMode.fromJson(newGoods));
    }

    cartString = json.encode(tempList).toString();
    sharedPreferences.setString("cartInfo", cartString);
    notifyListeners();
    print("购物车${cartString}");
  }

  remove() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('cartInfo');
    cartList = [];
    notifyListeners();
  }

  getCartList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.cartList = [];
    String str = sharedPreferences.getString("cartInfo");
    List<Map> tempList = (json.decode(str) as List).cast();
    allPrice = 0.0;
    allGoodsCount = 0;
    tempList.forEach((item) {
      if (item['isCheck']) {
        allPrice += item['count'] * item['price'];
        allGoodsCount += item['count'];
      }
      cartList.add(CartInfoMode.fromJson(item));
    });
    notifyListeners();
  }

  deleteItem(String goodsId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cartString = sharedPreferences.getString('cartInfo');
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
    for (int i = 0; i < tempList.length; i++) {
      if (tempList[i]['goodsId'] == goodsId) {
        tempList.removeAt(i);
      }
    }
    sharedPreferences.setString('cartInfo', json.encode(tempList).toString());
    await getCartList();
  }

//    复选框状态选择
  changeCheckState(CartInfoMode item) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String cartString = sharedPreferences.getString('cartInfo');
    List<Map> listTemp = (json.decode(cartString.toString()) as List).cast();
    for(int i = 0; i < listTemp.length; i ++) {
      if(listTemp[i]['goodsId'] == item.goodsId) {
        listTemp[i] = item.toJson();
      }
    }
    sharedPreferences.setString('cartInfo', json.encode(listTemp).toString());
    await getCartList();
  }
//  changeCheckState(CartInfoMode cartItem) async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    cartString=prefs.getString('cartInfo');  //得到持久化的字符串
//    List<Map> tempList= (json.decode(cartString.toString()) as List).cast(); //声明临时List，用于循环，找到修改项的索引
//    int tempIndex =0;  //循环使用索引
//    int changeIndex=0; //需要修改的索引
//    tempList.forEach((item){
//      if(item['goodsId']==cartItem.goodsId){
//        //找到索引进行复制
//        changeIndex=tempIndex;
//      }
//      tempIndex++;
//    });
//    tempList[changeIndex]=cartItem.toJson(); //把对象变成Map值
//    cartString= json.encode(tempList).toString(); //变成字符串
//    prefs.setString('cartInfo', cartString);//进行持久化
//    await getCartList();  //重新读取列表
//  }
}
