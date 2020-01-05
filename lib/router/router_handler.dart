import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/pages/details_page.dart';
import 'package:flutter_shop/pages/jpush_page.dart';

Handler detailsHandler = new Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params){
  String goodsId = params['id'].first;
  return DetailsPage(goodsId);
});


Handler jpushHandler = new Handler(handlerFunc: (BuildContext context,Map<String,List<String>> params){
  return JPushPage();
});