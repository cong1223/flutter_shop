import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/model/cart_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  String cartString = "";
  List<CartInfoMode> cartList = [];

  save(goodsId,goodsName,count,price,images) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    cartString = sharedPreferences.getString("cartInfo");
    var temp = cartString == null ? [] : json.decode(cartString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isHave = false;
    int ival = 0;
    tempList.forEach((item){
      if(item['goodsId']== goodsId) {
        isHave = true;
        tempList[ival]['count'] ++;
        cartList[ival].count ++;
      }
      ival ++;
    });
    if(!isHave) {
      Map<String,dynamic> newGoods = {
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images
      };
      tempList.add(newGoods);
      cartList.add(CartInfoMode.fromJson(newGoods));
    }

    cartString = json.encode(tempList).toString();
    sharedPreferences.setString("cartInfo",cartString);
    notifyListeners();
    print("购物车${cartString}");
  }

  remove() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('cartInfo');
    cartList = [];
    notifyListeners();
  }

//  getCartList() async{
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    String str = sharedPreferences.getString("cartInfo");
//    if(str == null) {
//      cartList = [];
//    }else {
//      List<Map> tempList = (json.decode(str) as List).cast();
//      tempList.forEach((item){
//        cartList.add(CartInfoMode.fromJson(item));
//      });
//    }
//    notifyListeners();
//  }
}