import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/data/details.dart';
import 'package:flutter_shop/model/details_model.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailsInfoProvider with ChangeNotifier{
  DetailsModel goodsInfo = null;

  bool isLeft = true;
  bool isRight = false;

  // 切换底部(购物车/评论)tabbar
  changeLeftAndRight(String changeState) {
    if(changeState == 'left') {
      this.isLeft = true;
      this.isRight = false;
    }else {
      this.isLeft = false;
      this.isRight = true;
    }
    notifyListeners();
  }

//  模拟从后台获取数据
  getGoodsInfo({String id}) {
//    var params = {'id':id};
//    request("",params: params).then((res){
//      var responseData = json.decode(res.toString());
//    });
//  notifyListeners();
    goodsInfo = DetailsModel.fromJson(details);
  }

}