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
  bool isAllCheck = true;

  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cartString = sharedPreferences.getString("cartInfo");
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int ival = 0;
    allPrice=0;
    allGoodsCount=0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        isHave = true;
        tempList[ival]['count']++;
        cartList[ival].count++;
      }
      if(item['isCheck']){
        allPrice+= (cartList[ival].price* cartList[ival].count);
        allGoodsCount+= cartList[ival].count;
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
      allPrice+= (count * price);
      allGoodsCount+=count;
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
    isAllCheck = true;
    tempList.forEach((item) {
      if (item['isCheck']) {
        allPrice += item['count'] * item['price'];
        allGoodsCount += item['count'];
      }else {
        isAllCheck = false;
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

//  改变全选按钮状态
  changeAllCheckBtnState(bool isCheck) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String cartString = sharedPreferences.getString('cartInfo');
    List<Map> listTemp = (json.decode(cartString) as List).cast();
    for (int i = 0; i < listTemp.length; i ++) {
      listTemp[i]['isCheck'] = isCheck;
    }
    sharedPreferences.setString('cartInfo', json.encode(listTemp).toString());
    await getCartList();
  }

//  改变商品数量
  changeGoodsCount(CartInfoMode item, String todo) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String cartString = sharedPreferences.getString('cartInfo');
    List<Map> listTemp = (json.decode(cartString) as List).cast();
    for(int i=0;i<listTemp.length;i++) {
      if(item.goodsId == listTemp[i]['goodsId']) {
        if(todo == 'add') {
          listTemp[i]['count'] ++;
        }else {
          if (listTemp[i]['count'] > 0) {
            listTemp[i]['count'] --;
          }
        }
      }
    }
    sharedPreferences.setString('cartInfo', json.encode(listTemp).toString());
    await getCartList();
  }
}
