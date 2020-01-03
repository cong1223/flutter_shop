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
        'images':images,
        'isCheck': true
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

  getCartList() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    this.cartList = [];
    String str = sharedPreferences.getString("cartInfo");
    List<Map> tempList = (json.decode(str) as List).cast();
    allPrice = 0.0;
    allGoodsCount = 0;
    tempList.forEach((item){
      if(item['isCheck']) {
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
      for(int i = 0; i < tempList.length; i++) {
        if(tempList[i]['goodsId'] == goodsId) {
          tempList.removeAt(i);
        }
      }
      sharedPreferences.setString('cartInfo', json.encode(tempList).toString());
      await getCartList();
    }
}